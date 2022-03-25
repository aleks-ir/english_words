import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/categories/delete_category_usecase.dart';

import 'mock_category_repository.mocks.dart';

void main() {
  late DeleteCategoryUsecase usecase;
  late MockCategoryRepository mockRepository;

  setUp(() {
    mockRepository = MockCategoryRepository();
    usecase = DeleteCategoryUsecase(mockRepository);
  });

  const tTitle = 'title';
  final tExpected =
  Success(message: '$tTitle successfully delete!');


  test(
    'should delete category in the repository',
    () async {
      when(mockRepository.deleteCategory(tTitle))
          .thenAnswer((_) async => Future);

      final result = await usecase(tTitle);
      final resultStatus = result.getOrElse(() => Success(message: ''));

      expect(
          resultStatus.message,
          tExpected.message);
      verify(
          mockRepository.deleteCategory(tTitle));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
