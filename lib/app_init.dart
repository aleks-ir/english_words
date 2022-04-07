import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:word_study_puzzle/presentation/theme_switcher.dart';

import 'common/constants/box_keys.dart';
import 'common/constants/default.dart';
import 'common/constants/initial_categories.dart';
import 'data/dto/settings_dto.dart';
import 'domain/models/history.dart';
import 'domain/usecases/categories/create_and_fill_in_category_usecase.dart';
import 'domain/usecases/history/create_update_history_usecase.dart';

class AppInit {
  final CreateAndFillInCategoryUsecase createCategoryUsecase;
  final CreateUpdateHistoryUsecase createUpdateHistoryUsecase;
  final ThemeSwitcher theme;

  AppInit({
    required this.createCategoryUsecase,
    required this.createUpdateHistoryUsecase,
    required this.theme,
  });

  void initLocalData(Box settingsBox) async {
    final SettingsDto settings = await settingsBox.get(BoxKeys.settings,
        defaultValue: SettingsDto.fromDomain(defaultSettings));
    if (!settings.hasLocalData) {
      _createDefaultCategories();
      settingsBox.put(BoxKeys.settings, settings.copyWith(hasLocalData: true));

      await createUpdateHistoryUsecase(
          History(date: '2022-03-25', wordExploredCount: 10));
      await createUpdateHistoryUsecase(
          History(date: '2022-03-26', wordExploredCount: 15));
      await createUpdateHistoryUsecase(
          History(date: '2022-03-27', wordExploredCount: 1));
      await createUpdateHistoryUsecase(
          History(date: '2022-03-28', wordExploredCount: 4));
      await createUpdateHistoryUsecase(
          History(date: '2022-03-30', wordExploredCount: 9));
      await createUpdateHistoryUsecase(
          History(date: '2022-04-02', wordExploredCount: 6));
    }
  }

  void _createDefaultCategories() {
    initialPathCategoriesMap.forEach((path, category) async {
      final result = await createCategoryUsecase(path, category.toDomain());
      result.fold((exception) => print(exception.message),
          (successMessage) => print(successMessage.message));
    });
  }

  void initTheme(Box settingsBox) async {
    final SettingsDto settings = await settingsBox.get(BoxKeys.settings,
        defaultValue: SettingsDto.fromDomain(defaultSettings));
    theme.changeTheTheme(settings.darkThemeIsEnabled);
  }
}
