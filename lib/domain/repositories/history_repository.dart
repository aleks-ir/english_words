
import 'package:words_3000_puzzle/data/dto/history_dto.dart';

abstract class HistoryRepository {
  List<HistoryDto> getAllHistories();
  Future<HistoryDto> getHistory(String id);
  Future addUpdateHistory(String id, HistoryDto category);
}
