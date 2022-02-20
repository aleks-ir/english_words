import 'package:flutter/services.dart';
import 'package:words_3000_puzzle/domain/datasources/local/data_assets.dart';

class DataAssetsImpl implements DataAssets {

  @override
  Future<String> loadStringAsset(String path) async{
    try {
      return await rootBundle.loadString(path);
    } catch (_) {
      rethrow;
    }
  }
}
