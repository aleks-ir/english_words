part of 'words_bloc.dart';

@freezed
abstract class WordsEvent with _$WordsEvent {

  factory WordsEvent.initMod() = InitMod;

  factory WordsEvent.addSelectedItem(Word item, indexUrl) = AddSelectedItem;

  factory WordsEvent.removeSelectedItem(Word item) = RemoveSelectedItem;

  factory WordsEvent.clearSelectedItems() = ClearSelectedItems;

  factory WordsEvent.switchListView() = SwitchListView;

  factory WordsEvent.changeType(String type) = ChangeType;

  factory WordsEvent.changeKeyword(String keyword) = ChangeKeyword;

  factory WordsEvent.fetchAllWords() = FetchAllWords;

  factory WordsEvent.addWord(String title) = AddWord;

  factory WordsEvent.deleteWords() = DeleteWords;

  factory WordsEvent.addWordsInExplore() = AddWordsInExplore;

  factory WordsEvent.removeWordsFromExplore() = RemoveWordsFromExplore;


}
