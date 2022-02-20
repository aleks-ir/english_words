
import 'package:words_3000_puzzle/data/dto/category_dto.dart';

abstract class CategoryRepository {
  List<CategoryDto> getAllCategories();
  Future<CategoryDto> getCategory(String id);
  Future addUpdateCategory(String id, CategoryDto category);
  Future deleteCategory(String id);
  Future addCategoryWithDataFromAsset(String path, CategoryDto category);
}
