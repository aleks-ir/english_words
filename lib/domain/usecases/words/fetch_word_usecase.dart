import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/common/exception.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/repositories/word_repository.dart';

class FetchWordUsecase {
  final WordRepository repository;
  FetchWordUsecase(this.repository);

  Future<Either<Error, Word>> call(String title) async {
    try {
      final wordDto = repository.getWord(title);
      return right(wordDto.toDomain());
    } catch (e) {
      if (e is NoExistException) {
        return left(
          Error(message: 'Failed to get $title. Word is not exist'),
        );
      }
      return left(
        Error(message: 'Failed to load word'),
      );
    }

  }
}

