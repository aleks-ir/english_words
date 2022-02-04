import 'package:hive_flutter/hive_flutter.dart';

abstract class HistoryDatabase {
  Box get box;
  List<T> getAll<T>();
  T get<T>(String id);
  Future addUpdate<T>(String id, T item);
}
