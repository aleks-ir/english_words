
import 'package:words_3000_puzzle/data/dto/history_dto.dart';

abstract class HistoryRepository {
  List<HistoryDto> getAllHistories();
  Future<HistoryDto> getHistory(String date);
  Future addUpdateHistory(String date, HistoryDto history);
}
