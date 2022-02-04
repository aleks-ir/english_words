import 'package:hive_flutter/hive_flutter.dart';

abstract class SettingsDatabase {
  Box get box;
  T get<T>(String id);
  Future update<T>(String id, T item);

}
