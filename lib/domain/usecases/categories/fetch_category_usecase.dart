import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';

import '../../models/category.dart';
import '../../repositories/category_repository.dart';

class FetchCategoryUsecase {
  final CategoryRepository repository;
  FetchCategoryUsecase(this.repository);

  Future<Either<Error, Category>> call(String title) async {
    try {
      final categoryDto = await repository.getCategory(title);
      final category = categoryDto.toDomain();

      return right(category);
    } catch (e) {
      return left(
        Error(message: 'Failed to get category "$title"'),
      );
    }

  }
}

