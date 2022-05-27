import 'package:word_study_puzzle/data/dto/word_asset_dto.dart';

abstract class DataAssets {
  Future<List<WordAssetDto>> fetchWordAssetList(String path);
}
