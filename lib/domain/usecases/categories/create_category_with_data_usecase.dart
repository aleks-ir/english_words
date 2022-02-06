import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/success.dart';
import 'package:words_3000_puzzle/domain/repositories/category_repository.dart';

class CreateCategoryWithDataUsecase {
  final CategoryRepository repository;
  CreateCategoryWithDataUsecase(this.repository);

  Future<Either<Error, Success>> call(String path, Category category) async {
    try {
      final categoryDto = CategoryDto.fromDomain(category);
      await repository.addCategoryWithDataFromAsset(path, categoryDto);
      return right(Success(message: 'Category "${category.title}\" successfully created!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to create category "${category.title}\"'),
      );
    }

  }
}

