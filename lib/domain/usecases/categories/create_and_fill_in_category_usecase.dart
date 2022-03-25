import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/repositories/category_repository.dart';

class CreateAndFillInCategoryUsecase {
  final CategoryRepository repository;
  CreateAndFillInCategoryUsecase(this.repository);

  Future<Either<Error, Success>> call(String path, Category category) async {
    try {
      final categoryDto = CategoryDto.fromDomain(category);
      await repository.addCategoryWithDataFromAsset(path, categoryDto);
      return right(Success(message: '${category.title} successfully created and fill in!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to create ${category.title}'),
      );
    }

  }
}

