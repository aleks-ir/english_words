part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {

  factory HomeEvent.initSettings() = InitSettings;

  factory HomeEvent.initHistory() = InitHistory;

  factory HomeEvent.initUnexploredWords() = InitUnexploredWords;

  factory HomeEvent.updateScreen() = UpdateScreen;

  factory HomeEvent.changeCardPage(int pageIndex) = ChangeCardPage;

  factory HomeEvent.cleanUnexploredWords() = CleanUnexploredWords;

  factory HomeEvent.selectLetter(Word word, int letterKey) = SelectLetter;

  factory HomeEvent.unselectLetter(Word word, int letterIndex) = UnselectLetter;

  factory HomeEvent.studyWord(Word word) = StudyWord;

  factory HomeEvent.resetWord(Word word) = ResetWord;
}
