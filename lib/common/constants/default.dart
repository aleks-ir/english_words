import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';

final defaultCategory = Category(title: '3000 words', openingCost: 0, isEditable: false, wordList: []);
final defaultSettings = Settings(hasLocalData: false,
    darkThemeIsEnabled: false,
    isVibration: true,
    isNotification: false,
    timeNotification: '12:00',
    wordToExploreCount: 10,
    puzzleCount: 6,
    selectedCategory: '3000 words');