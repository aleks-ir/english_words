part of 'words_bloc.dart';

@freezed
abstract class WordsState with _$WordsState {
  factory WordsState.initState() = _InitWordsState;

  factory WordsState.loaded(List<Word> wordList, int selectedItems) = _WordsLoaded;

  factory WordsState.empty() = _WordsEmpty;

  factory WordsState.error(String message) = _WordsError;

  factory WordsState.success(String message) = _WordsSuccess;

}
