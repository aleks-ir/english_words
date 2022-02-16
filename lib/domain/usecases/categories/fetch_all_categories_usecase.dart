import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';

class FetchAllCategoriesUsecase {
  final CategoryRepository repository;
  FetchAllCategoriesUsecase(this.repository);

  Future<Either<Error, List<Category>>> call() async {
    try {
      final categoriesDto = repository.getAllCategories();
      final categories = categoriesDto.map((word) => word.toDomain()).toList();

      return right(categories);
    } catch (e) {
      return left(
        Error(message: 'Failed to load all categories'),
      );
    }

  }
}

