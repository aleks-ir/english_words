
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/data/dto/settings_dto.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';

abstract class SettingsRepository {
  Future<SettingsDto> getSettings(String id);
  Future addUpdateSettings(String id, SettingsDto category);
}
