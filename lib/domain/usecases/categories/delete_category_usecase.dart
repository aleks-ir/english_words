import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/repositories/category_repository.dart';

class DeleteCategoryUsecase {
  final CategoryRepository repository;
  DeleteCategoryUsecase(this.repository);

  Future<Either<Error, Success>> call(String title) async {
    try {
      await repository.deleteCategory(title);
      return right(Success(message: '$title successfully delete!'));
    }
    catch (e) {
      return left(
        Error(message: 'Failed to delete $title'),
      );
    }
  }
}

