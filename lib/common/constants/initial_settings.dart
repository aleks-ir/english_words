import 'package:words_3000_puzzle/data/dto/settings_dto.dart';

import 'box_keys.dart';

final defaultSettings = SettingsDto(hasLocalData: false,
    theme: 'light',
    isVibration: true,
    isNotification: false,
    timeNotification: '12:00',
    wordCount: 10,
    starCount: 0,
    selectedCategory: BoxKeys.settings);