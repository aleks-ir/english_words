
import 'package:word_study_puzzle/data/dto/history_dto.dart';

abstract class HistoryRepository {
  List<HistoryDto> getAllHistories();
  HistoryDto getHistory(String date);
  Future addUpdateHistory(String date, HistoryDto history);
}
