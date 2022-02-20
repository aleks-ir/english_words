import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class FetchAllWordsUsecase {
  final WordRepository repository;
  FetchAllWordsUsecase(this.repository);

  Future<Either<Error, List<Word>>> call() async {
    try {
      final wordsDto = repository.getAllWords();
      final words = wordsDto.map((word) => word.toDomain()).toList();

      return right(words);
    } catch (e) {
      return left(
        Error(message: 'Failed to load all words'),
      );
    }

  }
}

