import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/datasources/local/category_database.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.categoryDatabase});

  final CategoryDatabase categoryDatabase;


  @override
  List<CategoryDto> getAllCategories() {
    try {
      final categoriesDto =
      categoryDatabase.getAll().map((category) => category as CategoryDto).toList();
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
  Future addUpdateCategory(String id, CategoryDto category) async {
    try {
      await categoryDatabase.addUpdate(id, category);
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
}
