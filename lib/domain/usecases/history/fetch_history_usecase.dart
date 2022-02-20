import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/history.dart';
import 'package:words_3000_puzzle/domain/repositories/history_repository.dart';

class FetchHistoryUsecase {
  final HistoryRepository repository;
  FetchHistoryUsecase(this.repository);

  Future<Either<Error, History>> call(String date) async {
    try {
      final historyDto = await repository.getHistory(date);
      final history = historyDto.toDomain();

      return right(history);
    } catch (e) {
      return left(
        Error(message: 'Failed to get history "$date"'),
      );
    }

  }
}

