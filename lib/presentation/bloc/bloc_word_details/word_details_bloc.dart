import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/words/words.dart';

part 'word_details_bloc.freezed.dart';
part 'word_details_event.dart';
part 'word_details_state.dart';

class WordDetailsBloc extends Bloc<WordDetailsEvent, WordDetailsState> {
  final FetchWordUsecase fetchWordUsecase;
  late Word word;


  WordDetailsBloc(
      {
      required this.fetchWordUsecase,})
      : super(WordDetailsState.initState());

  @override
  Stream<WordDetailsState> mapEventToState(WordDetailsEvent event) async* {
    yield* event.map(
        fetchWord: _fetchWord,
        changeImage: _changeImage
    );
  }


  Stream<WordDetailsState> _fetchWord(FetchWord event) async* {
    yield WordDetailsState.loading();
    final errorOrSuccess = await fetchWordUsecase(event.title);
    yield errorOrSuccess.fold(
            (failure) => WordDetailsState.error(failure.message), (word) {
              this.word = word;
        return WordDetailsState.loaded(word, 0);
    });
  }

  Stream<WordDetailsState> _changeImage(ChangeImage event) async* {
    yield WordDetailsState.loaded(word, event.imageIndex);
  }

}
