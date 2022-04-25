import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/settings_dto.dart';
import 'package:word_study_puzzle/data/repositories/settings_repository_impl.dart';
import 'package:word_study_puzzle/domain/repositories/settings_repository.dart';

import 'mock_database.dart';



void main() {
  late SettingsRepository repository;
  late MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    repository = SettingsRepositoryImpl(settingsDatabase: mockDatabase);
  });

  final tSettings = SettingsDto(hasLocalData: false,
      darkThemeIsEnabled: "",
      isVibration: false,
      isNotification: false,
      timeNotification: '',
      wordToExploreCount: 0,
      day: 0,
      selectedCategory: "");

  test(
    'should get settings by key from the database',
        () async {
      when(mockDatabase.get('key')).thenAnswer((_) => tSettings);

      final result = await repository.getSettings('key');


      expect(result, tSettings);
      verify(
          mockDatabase.get('key'));
      verifyNoMoreInteractions(mockDatabase);
    },
  );


}


