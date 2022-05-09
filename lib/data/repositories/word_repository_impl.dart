import 'dart:math';

import 'package:word_study_puzzle/common/constants/box_keys.dart';
import 'package:word_study_puzzle/common/constants/word_status.dart';
import 'package:word_study_puzzle/common/exception.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/data/dto/image_response_dto.dart';
import 'package:word_study_puzzle/data/dto/settings_dto.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/data/dto/word_response_dto.dart';
import 'package:word_study_puzzle/domain/datasources/local/database.dart';
import 'package:word_study_puzzle/domain/datasources/remote/remote.dart';
import 'package:word_study_puzzle/domain/repositories/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl(
      {required this.categoryDatabase,
      required this.settingsDatabase,
      required this.imageApi,
      required this.wordApi});

  final Database categoryDatabase;
  final Database settingsDatabase;
  final ImageApi imageApi;
  final WordApi wordApi;

  @override
  List<WordDto> getAllWords() {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category =
          categoryDatabase.get(settings.selectedCategory) as CategoryDto;
      return category.wordList;
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future<WordDto> getWord(String title) async {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category =
          categoryDatabase.get(settings.selectedCategory) as CategoryDto;

      final wordIndex = searchWordIndexByTitle(category.wordList, title);
      if (wordIndex != -1) {
        final wordDto = category.wordList[wordIndex];
        final hasData = checkDataAvailability(wordDto);
        if (hasData) {
          return wordDto;
        } else {
          return fillInAndSaveMissingData(wordDto);
        }
      } else {
        throw AppException.noExist();
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<WordDto> getRandomUnexploredWord(List<String>? exclusionaryList) async {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category =
          categoryDatabase.get(settings.selectedCategory) as CategoryDto;

      List<WordDto> unexploredWords = [];
      List<WordDto> repetitionWords = [];
      repetitionWords.addAll(category.wordList
        ..map((word) => word.status == WordStatus.exploring && word.repetitionDay == settings.day));
      if(repetitionWords.isNotEmpty){
        unexploredWords.addAll(repetitionWords);
      }else{
        unexploredWords.addAll(category.wordList
          ..map((word) => word.status == WordStatus.unexplored));
      }

      if(unexploredWords.isNotEmpty && exclusionaryList != null){
        unexploredWords = _removeExclusionaryWords(unexploredWords, exclusionaryList);
      }
      if (unexploredWords.isNotEmpty) {
        final randomIndex = Random().nextInt(unexploredWords.length);
        final unexploredWord = unexploredWords[randomIndex];
        final hasData = checkDataAvailability(unexploredWord);
        if (hasData) {
          return unexploredWord;
        } else {
          return fillInAndSaveMissingData(unexploredWord);
        }
      } else {
        throw AppException.empty(
            'Unfortunately, in the ${category.title} there are no unstudied words');
      }
    } catch (_) {
      rethrow;
    }
  }

  List<WordDto> _removeExclusionaryWords(List<WordDto> words, List<String> exclusionaryList){
    for(var title in exclusionaryList){
      words.removeWhere((word) => word.title == title);
    }
    return words;
  }

  @override
  Future addWord(WordDto word) async {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category =
          categoryDatabase.get(settings.selectedCategory) as CategoryDto;

      if (checkUniqueness(category.wordList, word)) {
        category.wordList.add(word);
        await categoryDatabase.addUpdate(settings.selectedCategory, category);
      } else {
        throw AppException.noUniqueness();
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future updateWord(WordDto word) async {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category =
          categoryDatabase.get(settings.selectedCategory) as CategoryDto;


      final wordIndex = searchWordIndexByTitle(category.wordList, word.title);
      if (wordIndex != -1) {
        final List<WordDto> wordList = [];
        wordList.addAll(category.wordList);
        wordList[wordIndex] = word;
        await categoryDatabase.addUpdate(settings.selectedCategory, category.copyWith(wordList: wordList));
      } else {
        throw AppException.noExist();
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteWord(WordDto word) async {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category =
          categoryDatabase.get(settings.selectedCategory) as CategoryDto;
      category.wordList.remove(word);
      await categoryDatabase.addUpdate(settings.selectedCategory, category);
    } catch (_) {
      rethrow;
    }
  }

  Future<WordDto> fillInAndSaveMissingData(WordDto wordDto) async {
    final imageResponseDto =
        await imageApi.getImageResponseFromApi(wordDto.title);
    final wordResponseDto = await wordApi.getWordResponseFromApi(wordDto.title);

    wordDto = wordDto.copyWith(pronunciation: wordResponseDto.pronunciation);
    wordDto =
        wordDto.copyWith(imageUrlList: _getImageUrlList(imageResponseDto));
    wordDto =
        wordDto.copyWith(definitionList: _getDefinitionList(wordResponseDto));
    wordDto = wordDto.copyWith(examplesList: _getExampleList(wordResponseDto));

    updateWord(wordDto);
    return wordDto;
  }

  List<String> _getImageUrlList(ImageResponseDto imageResponseDto) {
    return imageResponseDto.images.map((image) => image.imageSrc.url).toList();
  }

  List<String> _getDefinitionList(WordResponseDto wordResponseDto) {
    List<String> definitionList = [];
    for(var word in wordResponseDto.definitionAndExample){
      if(word.definition.isNotEmpty){
        definitionList.add(word.definition);
      }
    }
    return definitionList;
  }

  List<String> _getExampleList(WordResponseDto wordResponseDto) {
    List<String> examplesList = [];
    for(var word in wordResponseDto.definitionAndExample){
      if(word.example.isNotEmpty){
        examplesList.add(word.example);
      }
    }
    return examplesList;
  }

  bool checkDataAvailability(WordDto wordDto) {
    if (wordDto.definitionList.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool checkUniqueness(List<WordDto> wordList, WordDto word) {
    for (var item in wordList) {
      if (item.title == word.title) {
        return false;
      }
    }
    return true;
  }

  int searchWordIndexByTitle(List<WordDto> wordList, String title) {
    for (int index = 0; index < wordList.length; index++) {
      if (wordList[index].title == title) {
        return index;
      }
    }
    return -1;
  }
}
