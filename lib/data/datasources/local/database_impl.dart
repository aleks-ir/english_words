import 'package:hive_flutter/hive_flutter.dart';
import 'package:word_study_puzzle/common/exception.dart';
import 'package:word_study_puzzle/domain/datasources/local/database.dart';

class DatabaseImpl implements Database {
  final Box box;
  DatabaseImpl({required this.box});


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
  T get<T>(String id, {T? defaultValue}) {
    try {
      final data = box.get(id, defaultValue: defaultValue);
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
