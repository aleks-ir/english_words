import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/repositories/category_repository.dart';

class CreateCategoryUsecase {
  final CategoryRepository repository;
  CreateCategoryUsecase(this.repository);

  Future<Either<Error, Success>> call(Category category) async {
    try {
      final categoryDto = CategoryDto.fromDomain(category);

      if (!categoryDto.validCategory) {
        return left(
          Error(message: 'Failed to add, title should not empty'),
        );
      }
      await repository.addUpdateCategory(category.title, categoryDto);
      return right(Success(message: '${category.title} successfully created!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to create ${category.title}'),
      );
    }

  }
}

