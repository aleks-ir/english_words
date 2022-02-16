import 'dart:convert';

import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/datasources/local/data_assets.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';

import '../../domain/datasources/local/database.dart';

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
      List<WordDto> wordList = [];
      final String wordsJson = await dataAssets.loadStringAsset(path);
      final wordsMap = json.decode(wordsJson);
      wordsMap.map((value) {
        wordList.add(value);
      });

      await categoryDatabase.addUpdate(
          categoryDto.title, categoryDto.copyWith(wordList: wordList));
    } catch (_) {
      rethrow;
    }
  }
}
