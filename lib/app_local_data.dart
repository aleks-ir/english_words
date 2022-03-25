import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/constants/box_keys.dart';
import 'common/constants/default.dart';
import 'common/constants/initial_categories.dart';
import 'data/dto/settings_dto.dart';
import 'domain/usecases/categories/create_and_fill_in_category_usecase.dart';



class AppLocalData {
  final CreateAndFillInCategoryUsecase createCategoryUsecase;

  AppLocalData(
      {required this.createCategoryUsecase});

  
  void initLocalData(Box settingsBox) async {
    final SettingsDto settings = await settingsBox.get(BoxKeys.settings,
        defaultValue: SettingsDto.fromDomain(defaultSettings));
    if (!settings.hasLocalData) {
      _createDefaultCategories();
      settingsBox.put(BoxKeys.settings, settings.copyWith(hasLocalData: true));
    }
  }

  void _createDefaultCategories() {
    initialPathCategoriesMap.forEach((path, category) async{
      final result = await createCategoryUsecase(path, category.toDomain());
      result.fold((exception) => print(exception.message),
              (successMessage) => print(successMessage.message));
    });
  }
}
