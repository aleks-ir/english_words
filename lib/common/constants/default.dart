import 'package:words_3000_puzzle/data/dto/settings_dto.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';

import '../../domain/models/settings.dart';
import 'box_keys.dart';

final defaultCategory = Category(title: '3000 words', openingCost: 0, isEditable: false, wordList: []);
final defaultSettings = Settings(hasLocalData: false,
    theme: 'light',
    isVibration: true,
    isNotification: false,
    timeNotification: '12:00',
    wordCount: 10,
    starCount: 6,
    selectedCategory: BoxKeys.settings);