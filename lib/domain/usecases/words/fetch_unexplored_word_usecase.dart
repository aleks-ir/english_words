import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/common/exception.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/repositories/word_repository.dart';

class FetchUnexploredWordUsecase {
  final WordRepository repository;
  FetchUnexploredWordUsecase(this.repository);

  Future<Either<Error, Word>> call(List<String>? exclusionaryList) async {
    try {
      final wordDto = await repository.getRandomUnexploredWord(exclusionaryList);
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

