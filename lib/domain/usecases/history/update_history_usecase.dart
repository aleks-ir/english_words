
import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/history.dart';
import 'package:words_3000_puzzle/domain/models/success.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';
import 'package:words_3000_puzzle/domain/repositories/history_repository.dart';

class UpdateHistoryUsecase {
  final HistoryRepository repository;
  UpdateHistoryUsecase(this.repository);

  Future<Either<Error, Success>> call(History history) async {
    try {
      final historyDto = HistoryDto.fromDomain(history);
      await repository.addUpdateHistory(historyDto.data, historyDto);
      return right(Success(message: 'History "${history.data}\" successfully updated!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to update history "${history.data}\"'),
      );
    }

  }
}

