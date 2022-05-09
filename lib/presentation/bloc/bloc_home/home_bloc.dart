import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:word_study_puzzle/common/constants/other_constants.dart';
import 'package:word_study_puzzle/common/constants/word_status.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/history/history.dart';
import 'package:word_study_puzzle/domain/usecases/settings/fetch_settings.dart';
import 'package:word_study_puzzle/domain/usecases/words/fetch_unexplored_word_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/words/update_word_usecase.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CreateUpdateHistoryUsecase createUpdateHistoryUsecase;
  final FetchAllHistoriesUsecase fetchAllHistoriesUsecase;
  final FetchHistoryUsecase fetchHistoryUsecase;
  final FetchSettingsUsecase fetchSettingsUsecase;
  final FetchUnexploredWordUsecase fetchUnexploredWordUsecase;
  final UpdateWordUsecase updateWordUsecase;

  DateTime currentDate = DateTime.now();
  PageController pageController =
      PageController(initialPage: 0);

  late Settings settings;
  late History currentHistory;
  List<Word> unexploredWords = [];
  Map<String, List<String>> imageUrlMap = {};

  final _random = Random();

  HomeBloc(
      {required this.createUpdateHistoryUsecase,
      required this.fetchAllHistoriesUsecase,
      required this.fetchHistoryUsecase,
      required this.fetchSettingsUsecase,
      required this.fetchUnexploredWordUsecase,
      required this.updateWordUsecase})
      : super(HomeState.initState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.map(
      initSettings: _initSettings,
      initHistory: _initHistory,
      initUnexploredWords: _initUnexploredWords,
      updateScreen: _updateScreen,
      changeCardPage: _changeCardPage,
      cleanUnexploredWords: _cleanUnexploredWords,
      selectLetter: _selectLetter,
      unselectLetter: _unselectLetter,
      studyWord: _studyWord,
      resetWord: _resetWord,
    );
  }

  void _updateExploringWordCount() async {
    currentHistory.wordExploringCount += 1;
    await createUpdateHistoryUsecase(History(
        date: currentHistory.date,
        wordExploringCount: currentHistory.wordExploringCount,
        wordRepeatingCount: currentHistory.wordRepeatingCount,
        wordToExploreCount: settings.wordToExploreCount));
  }

  void _updateRepeatingWordCount() async {
    currentHistory.wordRepeatingCount += 1;
    await createUpdateHistoryUsecase(History(
        date: currentHistory.date,
        wordExploringCount: currentHistory.wordExploringCount,
        wordRepeatingCount: currentHistory.wordRepeatingCount,
        wordToExploreCount: settings.wordToExploreCount));
  }

  void _updateWord(Word word, bool isCorrectAnswer){
    if(word.status == WordStatus.unexplored){
      if(isCorrectAnswer){
        word.status = WordStatus.explored;
      }else{
        word.status = WordStatus.exploring;
        word.repetitionDay = settings.day + 1;
      }
    }else if(word.status == WordStatus.exploring){
      if(isCorrectAnswer){
        if(word.repetitionNum == 0){
          word.repetitionNum++;
          word.repetitionDay = settings.day + 7;
        }else if(word.repetitionNum == 1){
          word.repetitionNum++;
          word.repetitionDay = settings.day + 30;
        }else if(word.repetitionNum == 2){
          word.status = WordStatus.explored;
          word.repetitionDay = 0;
          word.repetitionNum = 0;
        }
      }else{
        word.repetitionDay++;
      }
    }
    updateWordUsecase(word);
  }


  Stream<HomeState> _initSettings(InitSettings event) async* {
    final errorOrSettings = await fetchSettingsUsecase();
    errorOrSettings.fold((error) => print(error.message), (settings) {
      this.settings = settings;
    });
  }

  Stream<HomeState> _initHistory(InitHistory event) async* {
    final date = DateFormat('yyyy-MM-dd').format(currentDate);
    final errorOrHistory = fetchHistoryUsecase(date);
    errorOrHistory.fold((error) => print(error.message), (history) {
      currentHistory = history;
    });
  }

  Stream<HomeState> _updateScreen(UpdateScreen event) async* {
    yield HomeState.content([]);
    yield HomeState.content(unexploredWords);
  }

  Stream<HomeState> _initUnexploredWords(InitUnexploredWords event) async* {
    unexploredWords.clear();
    unexploredWords.add(Word(title: "", isLoaded: false));
    yield HomeState.loadingWord();
    yield HomeState.content(unexploredWords);
    await _fetchUnexploredWord();
    yield HomeState.content(unexploredWords);

    unexploredWords.add(Word(title: "", isLoaded: false));
    yield HomeState.loadingWord();
    yield HomeState.content(unexploredWords);
    await _fetchUnexploredWord();
    yield HomeState.content(unexploredWords);

    if (unexploredWords.isEmpty) {
      yield HomeState.empty();
    }
  }

  Stream<HomeState> _changeCardPage(ChangeCardPage event) async* {
    if (event.pageIndex == unexploredWords.length - 1) {
      unexploredWords.add(Word(title: "", isLoaded: false));
      yield HomeState.loadingWord();
      yield HomeState.content(unexploredWords);
      await _fetchUnexploredWord(isRemoveLast: true);
      yield HomeState.content(unexploredWords);
    }
  }


  Future<HomeState> _fetchUnexploredWord({bool isRemoveLast = false}) async {
    final exclusionaryList = _buildExclusionaryList();
    final errorOrWord = await fetchUnexploredWordUsecase(exclusionaryList);

    unexploredWords.removeWhere((element) => !element.isLoaded);

    if (errorOrWord.isRight()) {
      final word = errorOrWord.getOrElse(() => Word(title: ''));
      word.letterMap = _buildLetterMap(word.title);
      word.selectedLetterList = _buildSelectedLetterList(word.title);
      unexploredWords.add(word);
      imageUrlMap[word.title] = _buildListUrl(word);
    }
    return HomeState.content(unexploredWords);
  }

  List<String> _buildExclusionaryList() {
    return unexploredWords.map((word) => word.title).toList();
  }

  Stream<HomeState> _cleanUnexploredWords(CleanUnexploredWords event) async* {
    unexploredWords.clear();
  }

  Stream<HomeState> _selectLetter(SelectLetter event) async* {
    final wordIndex = unexploredWords.indexOf(event.word);
    final letter = unexploredWords[wordIndex].letterMap[event.letterKey] ?? '';
    final index =
        _searchFirstEmptyIndex(unexploredWords[wordIndex].selectedLetterList);
    if(index != -1){
      unexploredWords[wordIndex].letterMap[event.letterKey] = '';
      unexploredWords[wordIndex].selectedLetterList[index] = letter;
    }


    final hasAnswer =
        _checkHasAnswer(unexploredWords[wordIndex].selectedLetterList);
    if (hasAnswer) {
      final isCorrectAnswer = _checkAnswer(unexploredWords[wordIndex].title,
          unexploredWords[wordIndex].selectedLetterList);
      if (isCorrectAnswer) {
        if(unexploredWords[wordIndex].status == WordStatus.unexplored){
          _updateRepeatingWordCount();
        }
        unexploredWords[wordIndex].isAnswered = true;
        _updateWord(event.word, true);
      } else {
        unexploredWords[wordIndex].isAnswered = false;
      }
    }
    yield HomeState.content(unexploredWords);
  }

  Stream<HomeState> _unselectLetter(UnselectLetter event) async* {
    _removeLetter(event.word, event.letterIndex);
    yield HomeState.content(unexploredWords);
  }

  void _removeLetter(Word word, int letterIndex){
    final wordIndex = unexploredWords.indexOf(word);
    final letter =
    unexploredWords[wordIndex].selectedLetterList[letterIndex];
    if(letter.isNotEmpty){
      unexploredWords[wordIndex].selectedLetterList[letterIndex] = '';
      final key = _searchFirstEmptyKey(unexploredWords[wordIndex].letterMap);
      unexploredWords[wordIndex].letterMap[key] = letter;
      unexploredWords[wordIndex].isAnswered = null;
    }
  }

  bool _checkHasAnswer(List<String> selectedLetterList) {
    return !selectedLetterList.contains('');
  }

  bool _checkAnswer(String word, List<String> letters) {
    return word == letters.join('');
  }

  int _searchFirstEmptyIndex(List<String> list) {
    return list.indexWhere((element) => element.isEmpty);
  }

  int _searchFirstEmptyKey(Map<int, String> map) {
    for (var e in map.entries) {
      if (e.value.isEmpty) {
        return e.key;
      }
    }
    return 0;
  }

  Stream<HomeState> _studyWord(StudyWord event) async* {
    final wordIndex = unexploredWords.indexOf(event.word);
    unexploredWords[wordIndex].isAnswered = true;

    if(unexploredWords[wordIndex].status == WordStatus.unexplored){
      _updateExploringWordCount();
    }

    _updateWord(event.word, false);
  }

  Stream<HomeState> _resetWord(ResetWord event) async* {
    for(var index = 0; index < event.word.title.length; index++){
      _removeLetter(event.word, index);
    }
  }

  List<String> _buildSelectedLetterList(String word) {
    return List.generate(word.length, (index) => '');
  }

  Map<int, String> _buildLetterMap(String word) {
    final Map<int, String> letterMap = {};
    const letterCount = 16;
    final randomIndexList = List.generate(letterCount, (index) => index)
      ..shuffle(_random);

    for (var i = 0; i < letterCount; i++) {
      if (i < word.length) {
        letterMap[randomIndexList[i]] = word[i];
      } else {
        letterMap[randomIndexList[i]] = OtherConstants.chars
            .elementAt(_random.nextInt(OtherConstants.chars.length - 1));
      }
    }
    return letterMap;
  }

  List<String> _buildListUrl(Word word) {
    List<String> listUrl = [];

    final imageCount =
        word.imageUrlList.length < 4 ? word.imageUrlList.length : 4;
    final allIndexes = List.generate(word.imageUrlList.length, (index) => index)
      ..shuffle(_random);
    for (int i = 0; i < imageCount; i++) {
      final index = allIndexes[i];
      listUrl.add(word.imageUrlList[index]);
    }
    return listUrl;
  }
}
