import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/domain/usecases/categories/fetch_category_usecase.dart';

import 'mock_category_repository.mocks.dart';

void main() {
  late FetchCategoryUsecase usecase;
  late MockCategoryRepository mockRepository;

  setUp(() {
    mockRepository = MockCategoryRepository();
    usecase = FetchCategoryUsecase(mockRepository);
  });

  final tCategoryDto = CategoryDto(title: 'category');

  test(
    'Should get category from the repository',
    () async {
      when(mockRepository.getCategory(tCategoryDto.title)).thenAnswer((_) async => tCategoryDto);

      final result = await usecase(tCategoryDto.title);
      final resultCategory = result.getOrElse(() => tCategoryDto.copyWith(title: '').toDomain());

      expect(resultCategory, tCategoryDto.toDomain());
      verify(mockRepository.getCategory(tCategoryDto.title));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
