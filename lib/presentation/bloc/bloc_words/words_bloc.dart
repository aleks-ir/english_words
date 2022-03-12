import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_study_puzzle/data/dto/word_response_dto.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/words/create_word_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/words/fetch_all_words_usecase.dart';

import 'package:word_study_puzzle/data/dto/image_response_dto.dart';
import 'package:word_study_puzzle/domain/datasources/remote/image_api.dart';
import 'package:word_study_puzzle/domain/datasources/remote/word_api.dart';

part 'words_bloc.freezed.dart';
part 'words_event.dart';
part 'words_state.dart';


class WordsBloc extends Bloc<WordsEvent, WordsState> {
  late List<Word> listOfWords;
  final CreateWordUsecase addWordUsecase;
  final FetchAllWordsUsecase fetchAllWordsUsecase;

  final WordApi wordApiImpl;
  final ImageApi imageApiImpl;

  WordsBloc({required this.addWordUsecase, required this.fetchAllWordsUsecase, required this.wordApiImpl, required this.imageApiImpl})
      : super(WordsState.initState());

  @override
  Stream<WordsState> mapEventToState(WordsEvent event) async* {
    yield* event.map(
      fetchAllWords: _fetchAllWords,
      addWord: _addWord,
      deleteWord: _deleteWord,
        getWordResponseFromApi: _getWordResponseFromApi,
        getImageResponseFromApi: _getImageResponseFromApi
    );
  }
  
  Stream<WordsState> _getWordResponseFromApi(GetWordResponseFromApi event) async* {
    final response = await wordApiImpl.getWordResponseFromApi(event.word);
    yield WordsState.contentFromWordApi(response);

  }

  Stream<WordsState> _getImageResponseFromApi(GetImageResponseFromApi event) async* {
    final response = await imageApiImpl.getImageResponseFromApi(event.word);
    yield WordsState.contentFromImageApi(response);

  }


  Stream<WordsState> _fetchAllWords(FetchAllWords event) async* {
    final failureOrSuccess = await fetchAllWordsUsecase();

    yield failureOrSuccess.fold(
      (failure) => WordsState.error(failure.message),
      (listOfWords) => WordsState.content(listOfWords),
    );
  }

  Stream<WordsState> _addWord(AddWord event) async* {
    final word = Word(
      title: event.word,
    );
    final failureOrSuccess = await addWordUsecase(word);
    yield failureOrSuccess.fold(
      (failure) => WordsState.error(failure.message),
      (value) => WordsState.initState(),
    );
  }

  Stream<WordsState> _deleteWord(DeleteWord event) async* {
    yield WordsState.initState();
  }
}
