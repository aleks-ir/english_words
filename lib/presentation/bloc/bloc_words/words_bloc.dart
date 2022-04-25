import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/common/constants/word_status.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/categories/fetch_category_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/settings/fetch_settings.dart';
import 'package:word_study_puzzle/domain/usecases/words/words.dart';

part 'words_bloc.freezed.dart';

part 'words_event.dart';

part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  String typeWords = WordsPageKeys.allWordsKey;
  Map<Word, int?> selectedItems = {};
  Map<String, int> previewImagesUrl = {};
  String keyword = '';
  bool isEditableMod = false;
  bool isEditableCategory = false;
  bool isListView = true;
  bool isAddOrRemoveWord = false;

  final random = Random();

  final FetchSettingsUsecase fetchSettingsUsecase;
  final FetchCategoryUsecase fetchCategoryUsecase;
  final CreateWordUsecase createWordUsecase;
  final DeleteWordUsecase deleteWordUsecase;
  final FetchAllWordsUsecase fetchAllWordsUsecase;
  final UpdateWordUsecase updateWordUsecase;

  WordsBloc(
      {required this.fetchSettingsUsecase,
      required this.fetchCategoryUsecase,
      required this.createWordUsecase,
      required this.deleteWordUsecase,
      required this.fetchAllWordsUsecase,
      required this.updateWordUsecase})
      : super(WordsState.initState());

  @override
  Stream<WordsState> mapEventToState(WordsEvent event) async* {
    yield* event.map(
        initMod: _initMod,
        addSelectedItem: _addSelectedItem,
        removeSelectedItem: _removeSelectedItem,
        clearSelectedItems: _clearSelectedItems,
        buildPreviewImagesUrl: _buildPreviewImagesUrl,
        switchView: _switchView,
        changeType: _changeType,
        changeKeyword: _changeKeyword,
        fetchAllWords: _fetchAllWords,
        addWord: _addWord,
        deleteWords: _deleteWords,
        addWordsInExplore: _addWordsInExplore,
        removeWordsFromExplore: _removeWordsFromExplore);
  }

  Stream<WordsState> _initMod(InitMod event) async* {
    final errorOrSettings = await fetchSettingsUsecase();
    errorOrSettings.fold((error) => print(error.message), (settings) async {
      final errorOrSettings =
          await fetchCategoryUsecase(settings.selectedCategory);
      errorOrSettings.fold((error) => print(error.message), (currentCategory) {
        isEditableCategory = currentCategory.isEditable;
        isEditableMod = currentCategory.isEditable;
      });
    });
  }

  Stream<WordsState> _buildPreviewImagesUrl(
      BuildPreviewImagesUrl event) async* {
    final errorOrWords = await fetchAllWordsUsecase();
    if(errorOrWords.isRight()){
      final words = errorOrWords.getOrElse(() => []);
      for (var word in words) {
        if(word.imageUrlList.isNotEmpty){
          previewImagesUrl[word.title] = _getRandomIndex(word.imageUrlList);
        }
      }
    }
  }

  _getRandomIndex(List<String> images){
    if(images.length == 1){
      return 0;
    }else{
      return random.nextInt(images.length - 1);
    }
  }



  Stream<WordsState> _addSelectedItem(AddSelectedItem event) async* {
    selectedItems[event.item] = event.indexUrl;
  }

  Stream<WordsState> _removeSelectedItem(RemoveSelectedItem event) async* {
    selectedItems.remove(event.item);
  }

  Stream<WordsState> _clearSelectedItems(ClearSelectedItems event) async* {
    selectedItems.clear();
    yield WordsState.switchedView();
  }

  Stream<WordsState> _switchView(SwitchView event) async* {
    isListView = isListView ? false : true;
    yield WordsState.switchedView();
  }

  Stream<WordsState> _changeType(ChangeType event) async* {
    typeWords = event.type;
    keyword = '';
    selectedItems.clear();
    if (typeWords == WordsPageKeys.allWordsKey) {
      isEditableMod = isEditableCategory;
    } else {
      isEditableMod = true;
    }
    yield WordsState.changedType();
  }

  Stream<WordsState> _changeKeyword(ChangeKeyword event) async* {
    keyword = event.keyword;
  }

  Stream<WordsState> _fetchAllWords(FetchAllWords event) async* {
    final errorOrWords = await fetchAllWordsUsecase();
    yield errorOrWords.fold((failure) => WordsState.error(failure.message),
        (wordList) {
      if (wordList.isEmpty) {
        return WordsState.empty();
      } else {
        final wordsByType = _selectWordsByType(wordList);
        final wordsByKeyword = _selectWordsByKeyword(wordsByType, keyword);
        return WordsState.loaded(wordsByKeyword, selectedItems.length);
      }
    });
  }

  List<Word> _selectWordsByType(List<Word> wordList) {
    if (typeWords == WordsPageKeys.exploringWordsKey) {
      return wordList
          .where((word) => word.status == WordStatus.exploring)
          .toList();
    } else if (typeWords == WordsPageKeys.unexploredWordsKey) {
      return wordList
          .where((word) => word.status == WordStatus.unexplored)
          .toList();
    } else {
      return wordList;
    }
  }

  List<Word> _selectWordsByKeyword(List<Word> wordList, String keyword) {
    return wordList.where((word) => word.title.contains(keyword)).toList();
  }

  Stream<WordsState> _addWord(AddWord event) async* {
    final word = Word(title: event.title);
    final errorOrSuccess = await createWordUsecase(word);
    if(errorOrSuccess.isRight()){
      isAddOrRemoveWord = true;
    }
    if (errorOrSuccess.isLeft()) {
      final error =
          errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield WordsState.error(error.message);
    }

  }

  Stream<WordsState> _deleteWords(DeleteWords event) async* {
    bool successDelete = true;
    for (var item in selectedItems.entries) {
      if (successDelete) {
        successDelete = await _deleteWord(item.key);
        previewImagesUrl.remove(item.key.title);
      }
    }
    if (successDelete) {
      isAddOrRemoveWord = true;
      selectedItems.clear();
      yield WordsState.success('The words successfully deleted');
    } else {
      yield WordsState.error('Failed to delete words');
    }
  }

  Stream<WordsState> _addWordsInExplore(AddWordsInExplore event) async* {
    bool successUpdate = true;
    for (var item in selectedItems.entries) {
      if (successUpdate) {
        item.key.status = WordStatus.exploring;
        successUpdate = await _updateWord(item.key);
      }
    }
    if (successUpdate) {
      yield WordsState.success('The words successfully added to study');
    } else {
      yield WordsState.error('Failed to add words to study');
    }
  }

  Stream<WordsState> _removeWordsFromExplore(
      RemoveWordsFromExplore event) async* {
    bool successUpdate = true;
    for (var item in selectedItems.entries) {
      if (successUpdate) {
        item.key.status = WordStatus.unexplored;
        successUpdate = await _updateWord(item.key);
      }
    }
    if (successUpdate) {
      yield WordsState.success('The words successfully removed to study');
    } else {
      yield WordsState.error('Failed to remove words to study');
    }
  }

  Future<bool> _deleteWord(Word word) async {
    final errorOrSuccess = await deleteWordUsecase(word);
    return errorOrSuccess.fold(
      (error) => false,
      (success) => true,
    );
  }

  Future<bool> _updateWord(Word word) async {
    final errorOrSuccess = await updateWordUsecase(word);
    return errorOrSuccess.fold(
      (error) => false,
      (success) => true,
    );
  }
}
