import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/domain/models/errors.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class FetchAllWordsUsecase {
  final WordRepository _repository;
  FetchAllWordsUsecase(this._repository);

  Future<Either<WordError, List<Word>>> call() async {
    try {
      final wordsDto = await _repository.getAllWords();
      final words = wordsDto.map((word) => word.toDomain()).toList();

      return right(words);
    } catch (e) {
      return left(
        WordError(message: 'Failed to load words, please try again.'),
      );
    }

  }
}

