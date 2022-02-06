import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/history.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';
import 'package:words_3000_puzzle/domain/repositories/history_repository.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class FetchAllHistoriesUsecase {
  final HistoryRepository repository;
  FetchAllHistoriesUsecase(this.repository);

  Future<Either<Error, List<History>>> call() async {
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

