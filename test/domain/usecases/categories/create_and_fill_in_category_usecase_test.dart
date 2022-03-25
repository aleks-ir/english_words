import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/categories/create_and_fill_in_category_usecase.dart';

import 'mock_category_repository.mocks.dart';

void main() {
  late CreateAndFillInCategoryUsecase usecase;
  late MockCategoryRepository mockRepository;

  setUp(() {
    mockRepository = MockCategoryRepository();
    usecase = CreateAndFillInCategoryUsecase(mockRepository);
  });

  final tCategoryDto = CategoryDto(
      title: 'title');
  const tPath = "path";
  final tExpected = Success(
      message: '${tCategoryDto.title} successfully created and fill in!');

  test(
    'should create and fill in category in the repository ',
    () async {
      when(mockRepository.addCategoryWithDataFromAsset(tPath, tCategoryDto))
          .thenAnswer((_) async => Future);

      final result = await usecase(tPath, tCategoryDto.toDomain());

      final resultCategory = result.getOrElse(() => Success(message: ''));

      expect(resultCategory.message, tExpected.message);
      verify(
          mockRepository.addCategoryWithDataFromAsset(tPath, tCategoryDto));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
