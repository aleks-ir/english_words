
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';

abstract class HistoryRepository {
  List<HistoryDto> getAllHistories();
  Future<HistoryDto> getHistory(String id);
  Future addUpdateHistory(String id, HistoryDto category);
}
