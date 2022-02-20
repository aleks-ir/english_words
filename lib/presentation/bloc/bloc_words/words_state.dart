part of 'words_bloc.dart';

@freezed
abstract class WordsState with _$WordsState {
  factory WordsState.initState() = _InitWordsState;

  factory WordsState.loading() = _WordsLoading;

  factory WordsState.contentFromWordApi(WordResponseDto wordResponseDto) = _ContentFromWordApi;

  factory WordsState.contentFromImageApi(ImageResponseDto imageResponseDto) = _ContentFromImageApi;

  factory WordsState.content(List<Word> listOfWords) = _WordsContent;

  factory WordsState.error(message) = _WordsError;
}
