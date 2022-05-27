import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:word_study_puzzle/data/dto/word_asset_dto.dart';
import 'package:word_study_puzzle/domain/datasources/local/data_assets.dart';

class DataAssetsImpl implements DataAssets {

  @override
  Future<List<WordAssetDto>> fetchWordAssetList(String path) async{
    try {
      List<WordAssetDto> wordAssetList = [];
      final jsonData = await rootBundle.loadString(path);
      for(Map<String, dynamic> item in json.decode(jsonData)){
        wordAssetList.add(WordAssetDto.fromJson(item));
      }
      return wordAssetList;
    } catch (_) {
      rethrow;
    }
  }
}
