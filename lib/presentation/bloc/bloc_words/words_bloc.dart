import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/common/constants/word_status.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/settings/fetch_settings.dart';
import 'package:word_study_puzzle/domain/usecases/words/words.dart';

part 'words_bloc.freezed.dart';
part 'words_event.dart';
part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  String typeWordList = WordsPageKeys.allWordsKey;
  Map<Word, int?> selectedItems = {};

  final FetchSettingsUsecase fetchSettingsUsecase;
  final CreateWordUsecase createWordUsecase;
  final DeleteWordUsecase deleteWordUsecase;
  final FetchAllWordsUsecase fetchAllWordsUsecase;
  final UpdateWordUsecase updateWordUsecase;

  WordsBloc(
      {required this.fetchSettingsUsecase,
      required this.createWordUsecase,
      required this.deleteWordUsecase,
      required this.fetchAllWordsUsecase,
      required this.updateWordUsecase})
      : super(WordsState.initState());

  @override
  Stream<WordsState> mapEventToState(WordsEvent event) async* {
    yield* event.map(
        addSelectedItem: _addSelectedItem,
        removeSelectedItem: _removeSelectedItem,
        clearSelectedItems: _clearSelectedItems,
        changeType: _changeType,
        fetchAllWords: _fetchAllWords,
        fetchWordsByKeyword: _fetchWordsByKeyword,
        addWord: _addWord,
        deleteWords: _deleteWords,
        addWordsInExplore: _addWordsInExplore,
        removeWordsFromExplore: _removeWordsFromExplore);
  }

  Stream<WordsState> _addSelectedItem(AddSelectedItem event) async* {
    selectedItems[event.item] = event.indexUrl;
  }

  Stream<WordsState> _removeSelectedItem(RemoveSelectedItem event) async* {
    selectedItems.remove(event.item);
  }

  Stream<WordsState> _clearSelectedItems(ClearSelectedItems event) async* {
    selectedItems.clear();
    yield WordsState.initState();
  }

  Stream<WordsState> _changeType(ChangeType event) async* {
    typeWordList = event.type;
    selectedItems.clear();
    yield WordsState.initState();
  }

  Stream<WordsState> _fetchAllWords(FetchAllWords event) async* {
    final errorOrSuccess = await fetchAllWordsUsecase();
    yield errorOrSuccess.fold((failure) => WordsState.error(failure.message),
        (wordList) {
      if (wordList.isEmpty) {
        return WordsState.empty();
      } else {
        final words = _selectWordsByType(wordList);
        return WordsState.loaded(words, selectedItems.length);
      }
    });
  }

  Stream<WordsState> _fetchWordsByKeyword(FetchWordsByKeyword event) async* {
    final errorOrSuccess = await fetchAllWordsUsecase();
    yield errorOrSuccess.fold((failure) => WordsState.error(failure.message),
        (wordList) {
      if (wordList.isEmpty) {
        return WordsState.empty();
      } else {
        final wordsByType = _selectWordsByType(wordList);
        final wordsByKeyword =
            _selectWordsByKeyword(wordsByType, event.keyword);
        return WordsState.loaded(wordsByKeyword, selectedItems.length);
      }
    });
  }

  List<Word> _selectWordsByType(List<Word> wordList) {
    if (typeWordList == WordsPageKeys.exploringWordsKey) {
      return wordList
          .where((word) => word.status == WordStatus.exploring)
          .toList();
    } else if (typeWordList == WordsPageKeys.unexploredWordsKey) {
      return wordList
          .where((word) => word.status == WordStatus.unexplored)
          .toList();
    } else {
      return wordList;
    }
  }

  List<Word> _selectWordsByKeyword(List<Word> wordList, String keyword) {
    return wordList.where((word) => word.title.contains(keyword)).toList();
  }

  Stream<WordsState> _addWord(AddWord event) async* {
    final word = Word(title: event.title);
    final errorOrSuccess = await createWordUsecase(word);
    if (errorOrSuccess.isLeft()) {
      final error =
          errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield WordsState.error(error.message);
    }
  }

  Stream<WordsState> _deleteWords(DeleteWords event) async* {
    bool successDelete = true;
    for (var item in selectedItems.entries) {
      if (successDelete) {
        successDelete = await _deleteWord(item.key);
      }
    }
    if (successDelete) {
      yield WordsState.success('The words successfully deleted');
    } else {
      yield WordsState.error('Failed to delete words');
    }
    yield WordsState.initState();
  }

  Stream<WordsState> _addWordsInExplore(AddWordsInExplore event) async* {
    bool successUpdate = true;
    for (var item in selectedItems.entries) {
      if (successUpdate) {
        item.key.status = WordStatus.exploring;
        successUpdate = await _updateWord(item.key);
      }
    }
    if (successUpdate) {
      yield WordsState.success('The words successfully added to study');
    } else {
      yield WordsState.error('Failed to add words to study');
    }
    yield WordsState.initState();
  }

  Stream<WordsState> _removeWordsFromExplore(
      RemoveWordsFromExplore event) async* {
    bool successUpdate = true;
    for (var item in selectedItems.entries) {
      if (successUpdate) {
        item.key.status = WordStatus.unexplored;
        successUpdate = await _updateWord(item.key);
      }
    }
    if (successUpdate) {
      yield WordsState.success('The words successfully removed to study');
    } else {
      yield WordsState.error('Failed to remove words to study');
    }
    yield WordsState.initState();
  }

  Future<bool> _deleteWord(Word word) async {
    final errorOrSuccess = await deleteWordUsecase(word);
    return errorOrSuccess.fold(
      (error) => false,
      (success) => true,
    );
  }

  Future<bool> _updateWord(Word word) async {
    final errorOrSuccess = await updateWordUsecase(word);
    return errorOrSuccess.fold(
      (error) => false,
      (success) => true,
    );
  }
}
