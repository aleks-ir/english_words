import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';

part 'words_state.freezed.dart';

@freezed
abstract class WordsState with _$WordsState {
  factory WordsState.initState() = _InitWordsState;

  factory WordsState.loading() = _WordsLoading;

  factory WordsState.content(List<Word> listOfWords) = _WordsContent;

  factory WordsState.error() = _WordsError;
}
