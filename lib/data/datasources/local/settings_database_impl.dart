import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_3000_puzzle/common/constants.dart';
import 'package:words_3000_puzzle/common/exception.dart';
import 'package:words_3000_puzzle/domain/datasources/local/category_database.dart';
import 'package:words_3000_puzzle/domain/datasources/local/settings_database.dart';

class SettingsDatabaseImpl implements SettingsDatabase {
  @override
  Box get box => Hive.box(settingsBoxName);

  @override
  T get<T>(String id) {
    try {
      final data = box.get(id);
      if (data == null) {
        throw AppException.noRecords();
      }
      return data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future update<T>(String id, T item) async {
    try {
      await box.put(id, item);
    } catch (_) {
      rethrow;
    }
  }

}
