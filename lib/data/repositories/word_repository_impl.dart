import 'dart:math';

import 'package:words_3000_puzzle/common/constants/box_keys.dart';
import 'package:words_3000_puzzle/common/constants/word_status.dart';
import 'package:words_3000_puzzle/common/exception.dart';
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/settings_dto.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/datasources/local/category_database.dart';
import 'package:words_3000_puzzle/domain/datasources/local/settings_database.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl(
      {required this.categoryDatabase, required this.settingsDatabase});

  final CategoryDatabase categoryDatabase;
  final SettingsDatabase settingsDatabase;

  @override
  List<WordDto> getAllWords() {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category = categoryDatabase.get(settings.selectedCategory) as CategoryDto;
      return category.wordList;
    } catch (_) {
      rethrow;
    }
  }


  @override
  List<WordDto> getAllWordsByDate(String date) {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category = categoryDatabase.get(settings.selectedCategory) as CategoryDto;

      final words = category.wordList..map((word) => word.studyDate == date);
      return words;
    } catch (_) {
      rethrow;
    }
  }

  @override
  WordDto getWord(String title) {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category = categoryDatabase.get(settings.selectedCategory) as CategoryDto;

      final wordIndex = searchWordIndexByTitle(category.wordList, title);
      if(wordIndex != -1){
        final wordDto = fillInMissingData(category.wordList[wordIndex]);
        return wordDto;
      }else{
        throw AppException.noExist();
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  WordDto getRandomUnexploredWord() {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category = categoryDatabase.get(settings.selectedCategory) as CategoryDto;

      final unexploredWords = category.wordList..map((word) => word.status == WordStatus.unexplored);
      if(unexploredWords.isNotEmpty){
        final randomIndex = Random().nextInt(unexploredWords.length);
        final unexploredWord = fillInMissingData(unexploredWords[randomIndex]);
        return unexploredWord;
      }else{
        throw AppException.empty('In the category "${category.title} there are no words');
      }

    } catch (_) {
      rethrow;
    }
  }


  @override
  Future addWord(WordDto word) async {
    try {
      final settings = settingsDatabase.get(BoxKeys.settings) as SettingsDto;
      final category = categoryDatabase.get(settings.selectedCategory) as CategoryDto;
      
      if(checkUniqueness(category.wordList, word)){
        category.wordList.add(word);
        await categoryDatabase.addUpdate(settings.selectedCategory, category);
      }else{
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
      final category = categoryDatabase.get(settings.selectedCategory) as CategoryDto;

      final wordIndex = searchWordIndexByTitle(category.wordList, word.title);
      if(wordIndex != -1){
        category.wordList[wordIndex] = word;
        await categoryDatabase.addUpdate(settings.selectedCategory, category);
      }else{
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
      final category = categoryDatabase.get(settings.selectedCategory) as CategoryDto;
      category.wordList.remove(word);
      await categoryDatabase.addUpdate(settings.selectedCategory, category);
    } catch (_) {
      rethrow;
    }
  }

  WordDto fillInMissingData(WordDto word){
    if(word.imageLinksList.isEmpty){
      //TODO: call api image
    }
    if(word.meaningList.isEmpty || word.examplesList.isEmpty){
      //TODO: call api word
    }
    return word;
  }


  bool checkUniqueness(List<WordDto> wordList, WordDto word){
    for (var item in wordList) {
      if (item.title == word.title) {
        return false;
      }
    }
    return true;
  }

  

  int searchWordIndexByTitle(List<WordDto> wordList, String title){
    for(int index = 0; index < wordList.length; index++){
      if(wordList[index].title == title){
        return index;
      }
    }
    return -1;
  }
  
}
