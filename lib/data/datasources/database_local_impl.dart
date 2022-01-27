import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_3000_puzzle/common/constants.dart';
import 'package:words_3000_puzzle/common/exception.dart';
import 'package:words_3000_puzzle/domain/datasources/database_local.dart';

class DatabaseLocalImpl implements DatabaseLocal {
  @override
  Box get box => Hive.box(databaseBox);

  @override
  List<T> getAll<T>() {
    try {
      final data = box.toMap().values;
      if (data.isEmpty) {
        throw AppException.noRecords();
      }

      return data.toList().cast<T>();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future delete(String id) async {
    try {
      await box.delete(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future add<T>(String id, T item) async {
    try {
      await box.put(id, item);
    } catch (_) {
      rethrow;
    }
  }

}
