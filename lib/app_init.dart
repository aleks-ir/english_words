import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:word_study_puzzle/presentation/utils/theme_switcher.dart';

import 'common/constants/box_keys.dart';
import 'common/constants/initial_categories.dart';
import 'data/dto/settings_dto.dart';
import 'domain/usecases/categories/create_and_fill_in_category_usecase.dart';
import 'domain/usecases/history/create_update_history_usecase.dart';
import 'domain/usecases/history/fetch_all_histories_usecase.dart';

class AppInit {
  final CreateAndFillInCategoryUsecase createCategoryUsecase;
  final CreateUpdateHistoryUsecase createUpdateHistoryUsecase;
  final FetchAllHistoriesUsecase fetchAllHistoriesUsecase;
  final ThemeSwitcher theme;


  AppInit({
    required this.createCategoryUsecase,
    required this.createUpdateHistoryUsecase,
    required this.fetchAllHistoriesUsecase,
    required this.theme,
  });


  int _setupDay() {
    final errorOrHistories = fetchAllHistoriesUsecase();
    if (errorOrHistories.isRight()) {
      final histories = errorOrHistories.getOrElse(() => []);
      final day = 1 +
          histories
              .where((history) =>
                  history.awardWasReceived)
              .length;
      return day;
    }
    return 1;
  }

  void initLocalData(Box settingsBox) async {
    final SettingsDto settings = await settingsBox.get(BoxKeys.settings,
        defaultValue: SettingsDto.fromDomain(Initial.settings));
    if (!settings.hasLocalData) {
      _createDefaultCategories();
      settingsBox.put(BoxKeys.settings,
          settings.copyWith(hasLocalData: true, day: _setupDay()));
    }
  }

  void _createDefaultCategories() {
    Initial.pathCategoriesMap.forEach((path, category) async {
      final result = await createCategoryUsecase(path, category);
      result.fold((exception) => print(exception.message),
          (successMessage) => print(successMessage.message));
    });
  }

  void initTheme(Box settingsBox) async {
    final SettingsDto settings = await settingsBox.get(BoxKeys.settings,
        defaultValue: SettingsDto.fromDomain(Initial.settings));
    theme.changeTheTheme(settings.darkThemeIsEnabled);
  }
}
