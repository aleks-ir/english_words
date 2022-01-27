import 'package:hive_flutter/hive_flutter.dart';

abstract class DatabaseLocal {
  Box get box;
  List<T> getAll<T>();
  Future delete(String id);
  Future add<T>(String id, T item);
}
