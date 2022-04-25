import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/data/repositories/category_repository_impl.dart';
import 'package:word_study_puzzle/domain/datasources/local/data_assets.dart';
import 'package:word_study_puzzle/domain/repositories/category_repository.dart';

import 'mock_database.dart';

class MockDataAssets extends Mock implements DataAssets {}

void main() {
  late CategoryRepository repository;
  late MockDatabase mockDatabase;
  late MockDataAssets mockDataAssets;

  setUp(() {
    mockDatabase = MockDatabase();
    mockDataAssets = MockDataAssets();
    repository = CategoryRepositoryImpl(categoryDatabase: mockDatabase, dataAssets: mockDataAssets);
  });

  final tCategory = CategoryDto(title: "", openingDay: 0, isEditable: false, wordList: []);


  test(
    'should get settings by id from the database',
        () async {
      when(mockDatabase.get('id')).thenAnswer((_) => tCategory);

      final result = await repository.getCategory('id');


      expect(result, tCategory);
      verify(
          mockDatabase.get('id'));
      verifyNoMoreInteractions(mockDatabase);
    },
  );


  // test(
  //   'should delete settings in the database',
  //       () async {
  //     when(mockDatabase.delete('')).thenAnswer((_) => Future.value(0));
  //
  //     final result = await repository.deleteCategory('');
  //
  //     expect(result, Future);
  //     verify(
  //         mockDatabase.delete(''));
  //     verifyNoMoreInteractions(mockDatabase);
  //   },
  // );
}


