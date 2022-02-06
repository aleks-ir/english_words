import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/common/exception.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class FetchWordUsecase {
  final WordRepository repository;
  FetchWordUsecase(this.repository);

  Future<Either<Error, Word>> call() async {
    try {
      final wordDto = repository.getRandomUnexploredWord();
      return right(wordDto.toDomain());
    } catch (e) {
      if (e is EmptyException) {
        return left(
          Error(message: e.message),
        );
      }
      return left(
        Error(message: 'Failed to load study word'),
      );
    }

  }
}

