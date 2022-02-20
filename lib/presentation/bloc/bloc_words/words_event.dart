part of 'words_bloc.dart';

@freezed
abstract class WordsEvent with _$WordsEvent {


  factory WordsEvent.getWordResponseFromApi(String word) = GetWordResponseFromApi;

  factory WordsEvent.getImageResponseFromApi(String word) = GetImageResponseFromApi;

  factory WordsEvent.fetchAllWords() = FetchAllWords;

  factory WordsEvent.addWord(String word) = AddWord;

  factory WordsEvent.deleteWord(String word) = DeleteWord;

}
