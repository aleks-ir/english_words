import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/domain/usecases/categories/fetch_all_categories_usecase.dart';

import 'mock_category_repository.mocks.dart';

void main() {
  late FetchAllCategoriesUsecase usecase;
  late MockCategoryRepository mockRepository;

  setUp(() {
    mockRepository = MockCategoryRepository();
    usecase = FetchAllCategoriesUsecase(mockRepository);
  });

  final tCategoriesDto = [
    CategoryDto(title: 'category 1', openingCost: 5, isEditable: false, wordList: []),
  ].toList();
  final tCategories = [
    Category(title: 'category 1', openingCost: 5, isEditable: false, wordList: []),
  ].toList();

  test(
    'Should get all histories from the repository',
    () async {
      when(mockRepository.getAllCategories()).thenAnswer((_) => tCategoriesDto);

      final result = await usecase();
      final resultCategories = result.getOrElse(() => []);

      expect(resultCategories, tCategories);
      verify(mockRepository.getAllCategories());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
