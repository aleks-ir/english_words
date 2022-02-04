part of 'words_bloc.dart';

@freezed
abstract class WordsState with _$WordsState {
  factory WordsState.initState() = _InitWordsState;

  factory WordsState.loading() = _WordsLoading;

  factory WordsState.content(List<Word> listOfWords) = _WordsContent;

  factory WordsState.error() = _WordsError;
}
