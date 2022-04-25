import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/repositories/history_repository.dart';

class FetchHistoryUsecase {
  final HistoryRepository repository;
  FetchHistoryUsecase(this.repository);

  Either<Error, History> call(String date) {
    try {
      final historyDto = repository.getHistory(date);
      final history = historyDto.toDomain();

      return right(history);
    } catch (e) {
      return left(
        Error(message: 'Failed to get $date'),
      );
    }

  }
}

