part of 'words_bloc.dart';

@freezed
abstract class WordsEvent with _$WordsEvent {

  factory WordsEvent.addSelectedItem(Word item, indexUrl) = AddSelectedItem;

  factory WordsEvent.removeSelectedItem(Word item) = RemoveSelectedItem;

  factory WordsEvent.clearSelectedItems() = ClearSelectedItems;

  factory WordsEvent.changeType(String type) = ChangeType;

  factory WordsEvent.fetchAllWords() = FetchAllWords;

  factory WordsEvent.fetchWordsByKeyword(String keyword) = FetchWordsByKeyword;

  factory WordsEvent.addWord(String title) = AddWord;

  factory WordsEvent.deleteWords() = DeleteWords;

  factory WordsEvent.addWordsInExplore() = AddWordsInExplore;

  factory WordsEvent.removeWordsFromExplore() = RemoveWordsFromExplore;


}
