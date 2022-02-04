import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/data/dto/settings_dto.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/datasources/local/category_database.dart';
import 'package:words_3000_puzzle/domain/datasources/local/history_database.dart';
import 'package:words_3000_puzzle/domain/datasources/local/settings_database.dart';
import 'package:words_3000_puzzle/domain/repositories/history_repository.dart';
import 'package:words_3000_puzzle/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.settingsDatabase});

  final SettingsDatabase settingsDatabase;

  @override
  Future<SettingsDto> getSettings(String id) async {
    try {
      final settingsDto = await settingsDatabase.get(id) as SettingsDto;
      return settingsDto;
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future addUpdateSettings(String id, SettingsDto settings) async {
    try {
      await settingsDatabase.update(id, settings);
    } catch (_) {
      rethrow;
    }
  }

}
