import 'package:words_3000_puzzle/data/dto/settings_dto.dart';
import 'package:words_3000_puzzle/domain/datasources/local/settings_database.dart';
import 'package:words_3000_puzzle/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.settingsDatabase});

  final SettingsDatabase settingsDatabase;

  @override
  Future<SettingsDto> getSettings(String key) async {
    try {
      final settingsDto = await settingsDatabase.get(key);
      return settingsDto;
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future updateSettings(String key, SettingsDto settings) async {
    try {
      await settingsDatabase.update(key, settings);
    } catch (_) {
      rethrow;
    }
  }

}
