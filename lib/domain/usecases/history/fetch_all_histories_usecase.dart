import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/repositories/history_repository.dart';

class FetchAllHistoriesUsecase {
  final HistoryRepository repository;
  FetchAllHistoriesUsecase(this.repository);

  Either<Error, List<History>> call() {
    try {
      final historiesDto = repository.getAllHistories();
      final histories = historiesDto.map((history) => history.toDomain()).toList();

      return right(histories);
    } catch (e) {
      return left(
        Error(message: 'Failed to get all histories'),
      );
    }

  }
}

