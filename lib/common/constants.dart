import 'package:words_3000_puzzle/data/dto/settings_dto.dart';

enum PagesApp { home, calendar, categories, settings, words, about }

enum Themes {
  dark,
  light,
}

const String threeThousandWords = 'three_thousand_words';

const String categoryBoxName = 'category_box_name';
const String settingsBoxName = 'settings_box_name';
const String historyBoxName = 'history_box_name';
const String settingsKey = 'settings_key';

const defaultSettings = SettingsDto(
    timeNotification: '12:00',
    isNotification: false,
    hasLocalData: false,
    starCount: 5,
    isVibration: true,
    theme: 'Dark',
    wordCount: 10,
    selectedCategory: threeThousandWords);
