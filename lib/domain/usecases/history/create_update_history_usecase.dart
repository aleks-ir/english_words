
import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/data/dto/history_dto.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/repositories/history_repository.dart';

class CreateUpdateHistoryUsecase {
  final HistoryRepository repository;
  CreateUpdateHistoryUsecase(this.repository);

  Future<Either<Error, Success>> call(History history) async {
    try {
      final historyDto = HistoryDto.fromDomain(history);
      await repository.addUpdateHistory(historyDto.date, historyDto);
      return right(Success(message: '${history.date} successfully updated!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to update ${history.date}'),
      );
    }

  }
}

