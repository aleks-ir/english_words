import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/success.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';

class DeleteCategoryUsecase {
  final CategoryRepository repository;
  DeleteCategoryUsecase(this.repository);

  Future<Either<Error, Success>> call(String title) async {
    try {
      await repository.deleteCategory(title);
      return right(Success(message: 'Category "$title" successfully delete!'));
    }
    catch (e) {
      return left(
        Error(message: 'Failed to delete category "$title"'),
      );
    }
  }
}

