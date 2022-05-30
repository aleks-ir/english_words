import 'package:word_study_puzzle/data/dto/settings_dto.dart';
import 'package:word_study_puzzle/domain/datasources/local/database.dart';
import 'package:word_study_puzzle/domain/repositories/settings_repository.dart';


class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.settingsDatabase});

  final Database settingsDatabase;

  @override
  Future<SettingsDto> getSettings(String key) async {
    try {
      final settingsDto = await settingsDatabase.get(key) as SettingsDto;
      return settingsDto;
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future updateSettings(String key, SettingsDto settings) async {
    try {
      return await settingsDatabase.addUpdate(key, settings);
    } catch (_) {
      rethrow;
    }
  }

}
