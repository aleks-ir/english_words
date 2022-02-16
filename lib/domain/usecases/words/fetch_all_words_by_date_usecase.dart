import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class FetchAllWordsByDateUsecase {
  final WordRepository repository;
  FetchAllWordsByDateUsecase(this.repository);

  Future<Either<Error, List<Word>>> call(String date) async {
    try {
      final wordsDto = repository.getAllWordsByDate(date);
      final words = wordsDto.map((word) => word.toDomain()).toList();

      return right(words);
    } catch (e) {
      return left(
        Error(message: 'Failed to load words by date "$date"'),
      );
    }

  }
}

