
import 'package:word_study_puzzle/data/dto/settings_dto.dart';

abstract class SettingsRepository {
  Future<SettingsDto> getSettings(String key);
  Future updateSettings(String key, SettingsDto settings);
}
