import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/categories/create_category_usecase.dart';

import 'mock_category_repository.mocks.dart';

void main() {
  late CreateCategoryUsecase usecase;
  late MockCategoryRepository mockRepository;

  setUp(() {
    mockRepository = MockCategoryRepository();
    usecase = CreateCategoryUsecase(mockRepository);
  });

  final tCategoryDto = CategoryDto(
      title: 'title');
  final tExpected =
      Success(message: '${tCategoryDto.title} successfully created!');

  test(
    'should create category in the repository',
    () async {
      when(mockRepository.addUpdateCategory(tCategoryDto.title, tCategoryDto))
          .thenAnswer((_) async => Future);

      final result = await usecase(tCategoryDto.toDomain());

      final resultCategory = result.getOrElse(() => Success(message: ''));

      expect(
          resultCategory.message,
          tExpected.message);
      verify(
          mockRepository.addUpdateCategory(tCategoryDto.title, tCategoryDto));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
