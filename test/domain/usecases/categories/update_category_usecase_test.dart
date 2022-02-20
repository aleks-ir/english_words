import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/domain/models/success.dart';
import 'package:words_3000_puzzle/domain/usecases/categories/update_category_usecase.dart';

import 'mock_category_repository.mocks.dart';

void main() {
  late UpdateCategoryUsecase usecase;
  late MockCategoryRepository mockRepository;

  setUp(() {
    mockRepository = MockCategoryRepository();
    usecase = UpdateCategoryUsecase(mockRepository);
  });

  final tCategoryDto = CategoryDto(
      title: 'title', openingCost: 0, isEditable: true, wordList: []);
  final tCategory = Category(
      title: 'title', openingCost: 0, isEditable: true, wordList: []);
  final tExpected =
      Success(message: 'Category "${tCategoryDto.title}" successfully update!');


  test(
    'should update category in the repository',
    () async {
      when(mockRepository.addUpdateCategory(tCategoryDto.title, tCategoryDto))
          .thenAnswer((_) => Future(() => null));

      final result = await usecase(tCategory);

      final resultCategory = result.getOrElse(() => Success());

      expect(
          resultCategory.message,
          tExpected.message);
      verify(
          mockRepository.addUpdateCategory(tCategoryDto.title, tCategoryDto));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
