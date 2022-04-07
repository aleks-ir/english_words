import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/common/constants/box_keys.dart';
import 'package:word_study_puzzle/data/dto/settings_dto.dart';
import 'package:word_study_puzzle/domain/usecases/settings/fetch_settings.dart';

import 'mock_settings_repository.mocks.dart';


void main() {
  late FetchSettingsUsecase usecase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    usecase = FetchSettingsUsecase(mockRepository);
  });

  final tSettingsDto =
  SettingsDto(hasLocalData: true,
      darkThemeIsEnabled: 'dark',
      isVibration: false,
      isNotification: false,
      timeNotification: '20:00',
      wordToExploreCount: 15,
      puzzleCount: 5,
      selectedCategory: "selectedCategory");

  test(
    'should get settings from the repository',
        () async {
      when(mockRepository.getSettings(BoxKeys.settings))
          .thenAnswer((_) async => tSettingsDto);

      final result = await usecase();

      final resultSettings = result.getOrElse(
              () => tSettingsDto.copyWith(hasLocalData: false).toDomain());

      expect(resultSettings, tSettingsDto.toDomain());
      verify(mockRepository.getSettings(BoxKeys.settings));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
