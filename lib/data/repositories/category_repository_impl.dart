import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/data/dto/word_asset_dto.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/datasources/local/local.dart';
import 'package:word_study_puzzle/domain/repositories/category_repository.dart';


class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(
      {required this.categoryDatabase, required this.dataAssets});

  final Database categoryDatabase;
  final DataAssets dataAssets;

  @override
  List<CategoryDto> getAllCategories() {
    try {
      final categoriesDto = categoryDatabase
          .getAll()
          .map((category) => category as CategoryDto)
          .toList();
      return categoriesDto;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<CategoryDto> getCategory(String id) async {
    try {
      final categoryDto = await categoryDatabase.get(id) as CategoryDto;
      return categoryDto;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future addUpdateCategory(String id, CategoryDto categoryDto) async {
    try {
      await categoryDatabase.addUpdate(id, categoryDto);
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future deleteCategory(String id) async {
    try {
      await categoryDatabase.delete(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future addCategoryWithDataFromAsset(
      String path, CategoryDto categoryDto) async {
    try {
      final List<WordAssetDto> wordAssetList =
          await dataAssets.fetchWordAssetList(path);
      await categoryDatabase.addUpdate(
          categoryDto.title,
          categoryDto.copyWith(
            wordList: _buildWordList(wordAssetList),
          ));
    } catch (_) {
      rethrow;
    }
  }
}

List<WordDto> _buildWordList(List<WordAssetDto> wordAssetList){
  return wordAssetList.map((wordAsset) => WordDto(
      title: wordAsset.word,
      definitionList: _removeEmpty(wordAsset.definitions),
      examplesList: _removeEmpty(wordAsset.examples),
      imageUrlList: wordAsset.images)).toList();
}

List<String> _removeEmpty(List<String> list){
  list.removeWhere((element) => element.isEmpty);
  return list;
}
