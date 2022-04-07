import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/common/constants/box_keys.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/data/dto/settings_dto.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/data/repositories/word_repository_impl.dart';
import 'package:word_study_puzzle/domain/datasources/remote/image_api.dart';
import 'package:word_study_puzzle/domain/datasources/remote/word_api.dart';
import 'package:word_study_puzzle/domain/repositories/word_repository.dart';

import 'mock_database.dart';

class MockWordApi extends Mock implements WordApi {

}

class ImageWordApi extends Mock implements ImageApi {

}

void main() {
  late WordRepository repository;
  late MockDatabase mockSettingsDatabase;
  late MockDatabase mockCategoryDatabase;
  late MockWordApi mockWordApi;
  late ImageWordApi mockImageApi;

  setUp(() {
    mockSettingsDatabase = MockDatabase();
    mockCategoryDatabase = MockDatabase();
    mockWordApi = MockWordApi();
    mockImageApi = ImageWordApi();
    repository = WordRepositoryImpl(
        imageApi: mockImageApi,
        settingsDatabase: mockSettingsDatabase,
        wordApi: mockWordApi,
        categoryDatabase: mockCategoryDatabase);
  });

  final tSettings = SettingsDto(
      hasLocalData: true,
      darkThemeIsEnabled: "",
      isVibration: false,
      isNotification: false,
      timeNotification: '',
      wordToExploreCount: 0,
      puzzleCount: 0,
      selectedCategory: "category");
  final tCategory = CategoryDto(
      title: "category",
      openingCost: 0,
      isEditable: false,
      wordList: [
        WordDto(
            title: 'title',
            definitionList: ['definition'],
            examplesList: ['example'])
      ]);

  test(
    'should get word by title from the database',
    () async {
      when(mockSettingsDatabase.get(BoxKeys.settings))
          .thenAnswer((_) => tSettings);
      when(mockCategoryDatabase.get('category'))
          .thenAnswer((_) => tCategory);

      final result = repository.getWord('title');

      expect(result, tCategory.wordList[0]);
      verify(mockSettingsDatabase.get(BoxKeys.settings));
      verify(mockCategoryDatabase.get('category'));
      verifyNoMoreInteractions(mockSettingsDatabase);
      verifyNoMoreInteractions(mockCategoryDatabase);
    },
  );


  test(
    'should get random unexplored word from the database',
        () async {
      when(mockSettingsDatabase.get(BoxKeys.settings))
          .thenAnswer((_) => tSettings);
      when(mockCategoryDatabase.get('category'))
          .thenAnswer((_) => tCategory);

      final result = repository.getRandomUnexploredWord();

      expect(result, tCategory.wordList[0]);
      verify(mockSettingsDatabase.get(BoxKeys.settings));
      verify(mockCategoryDatabase.get('category'));
      verifyNoMoreInteractions(mockSettingsDatabase);
      verifyNoMoreInteractions(mockCategoryDatabase);
    },
  );

}
