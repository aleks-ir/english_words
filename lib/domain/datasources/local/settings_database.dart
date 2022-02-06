import 'package:hive_flutter/hive_flutter.dart';

abstract class SettingsDatabase {
  Box get box;
  T get<T>(String key);
  Future update<T>(String key, T item);

}
