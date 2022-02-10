import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/domain/datasources/local/history_database.dart';
import 'package:words_3000_puzzle/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl({required this.historyDatabase});

  final HistoryDatabase historyDatabase;


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
