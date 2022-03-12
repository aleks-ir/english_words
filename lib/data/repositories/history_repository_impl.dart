import 'package:word_study_puzzle/data/dto/history_dto.dart';
import 'package:word_study_puzzle/domain/repositories/history_repository.dart';

import 'package:word_study_puzzle/domain/datasources/local/database.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl({required this.historyDatabase});

  final Database historyDatabase;


  @override
  List<HistoryDto> getAllHistories() {
    try {
      final historyDto =
      historyDatabase.getAll().map((history) => history as HistoryDto).toList();
      return historyDto;
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future<HistoryDto> getHistory(String id) async {
    try {
      final historyDto = await historyDatabase.get(id) as HistoryDto;
      return historyDto;
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future addUpdateHistory(String id, HistoryDto history) async {
    try {
      await historyDatabase.addUpdate(id, history);
    } catch (_) {
      rethrow;
    }
  }

}
