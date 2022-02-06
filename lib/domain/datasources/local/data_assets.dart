import 'package:hive_flutter/hive_flutter.dart';

abstract class DataAssets {
  Future<String> loadStringAsset(String path);
}
