import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/common/constants/box_keys.dart';
import 'package:word_study_puzzle/data/dto/settings_dto.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/settings/update_settings.dart';

import 'mock_settings_repository.mocks.dart';


void main() {
  late UpdateSettingsUsecase usecase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    usecase = UpdateSettingsUsecase(mockRepository);
  });

  final tSettingsDto =
  SettingsDto(hasLocalData: true,
      darkThemeIsEnabled: 'dark',
      isVibration: false,
      isNotification: false,
      timeNotification: '20:00',
      wordToExploreCount: 15,
      day: 5,
      selectedCategory: "selectedCategory");

  final tExpected = Success(message: 'Settings successfully update!');
  test(
    'should update settings in the repository',
        () async {
      when(mockRepository.updateSettings(BoxKeys.settings, tSettingsDto))
          .thenAnswer((_) => Future(() => null));

      final result = await usecase(tSettingsDto.toDomain());

      final resultHistory = result.getOrElse(
              () => Success(message: ''));

      expect(resultHistory.message, tExpected.message);
      verify(mockRepository.updateSettings(BoxKeys.settings, tSettingsDto));
      verifyNoMoreInteractions(mockRepository);

    },
  );
}

