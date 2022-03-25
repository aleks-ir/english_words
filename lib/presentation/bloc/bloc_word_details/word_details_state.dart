part of 'word_details_bloc.dart';

@freezed
abstract class WordDetailsState with _$WordDetailsState {
  factory WordDetailsState.initState() = _InitWordDetailsState;

  factory WordDetailsState.loaded(Word word, imageIndex) = _WordLoaded;

  factory WordDetailsState.loading() = _WordLoading;

  factory WordDetailsState.error(String message) = _WordsError;
}
