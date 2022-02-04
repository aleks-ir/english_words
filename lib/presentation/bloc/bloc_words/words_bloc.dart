import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/usecases/words/add_word_usecase.dart';
import 'package:words_3000_puzzle/domain/usecases/words/fetch_all_words_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'words_event.dart';
part 'words_state.dart';
part 'words_bloc.freezed.dart';


class WordsBloc extends Bloc<WordsEvent, WordsState> {
  late List<Word> listOfWords;
  final AddWordUsecase addWordUsecase;
  final FetchAllWordsUsecase fetchAllWordsUsecase;

  WordsBloc({required this.addWordUsecase, required this.fetchAllWordsUsecase})
      : super(WordsState.initState());

  @override
  Stream<WordsState> mapEventToState(WordsEvent event) async* {
    yield* event.map(
      fetchAllWords: _fetchAllWords,
      addWord: _addWord,
      deleteWord: _deleteWord,
    );
  }

  Stream<WordsState> _fetchAllWords(FetchAllWords event) async* {
    final failureOrSuccess = await fetchAllWordsUsecase();

    yield failureOrSuccess.fold(
      (failure) => WordsState.error(),
      (listOfWords) => WordsState.content(listOfWords),
    );
  }

  Stream<WordsState> _addWord(AddWord event) async* {
    final word = Word(
      title: event.word,
      imageLinksList: [],
      examplesList: [],
      meaningList: [],
      status: '',
      studyDate: '',
    );
    final failureOrSuccess = await addWordUsecase(word);
    yield failureOrSuccess.fold(
      (failure) => WordsState.error(),
      (value) => WordsState.initState(),
    );
  }

  Stream<WordsState> _deleteWord(DeleteWord event) async* {
    yield WordsState.initState();
  }
}
