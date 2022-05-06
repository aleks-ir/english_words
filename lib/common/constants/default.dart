import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';

final defaultCategory = Category(
  title: '3000 words',
  openingCost: 1,
  isEditable: false,
  wordList: [],
  iconAssetIndex: 0,
  description: 'This is words :)',
);
final defaultSettings = Settings(
    hasLocalData: false,
    darkThemeIsEnabled: false,
    isVibration: true,
    isNotification: false,
    timeNotification: '12:00',
    wordToExploreCount: 10,
    day: 1,
    selectedCategory: '3000 words');


