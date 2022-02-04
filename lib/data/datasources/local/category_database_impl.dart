import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_3000_puzzle/common/constants.dart';
import 'package:words_3000_puzzle/common/exception.dart';
import 'package:words_3000_puzzle/domain/datasources/local/category_database.dart';

class CategoryDatabaseImpl implements CategoryDatabase {
  @override
  Box get box => Hive.box(categoryBoxName);

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
  Future addUpdate<T>(String id, T item) async {
    try {
      await box.put(id, item);
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
}
