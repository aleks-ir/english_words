
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';

class Initial{
  static final pathCategoriesMap = {
    'assets/categories/three_hundred_words.json' : Category(title: '300 common words', openingCost: 0, isEditable: false, wordList: [], iconAssetIndex: 0,
        description: 'Using these words you can understand about 65% of all written material in English' ),
    'assets/categories/science.json' : Category(title: 'Science', openingCost: 1, isEditable: false, wordList: [], iconAssetIndex: 1,
        description: 'Is the human endeavor to discover truths about the world around us' ),
    'assets/categories/art.json' : Category(title: 'Art', openingCost: 1, isEditable: false, wordList: [], iconAssetIndex: 8,
        description: 'Is any creative work of a human being' ),
  };

  static final settings = Settings(
      hasLocalData: false,
      darkThemeIsEnabled: false,
      viewCarouselIsEnabled: true,
      isVibration: true,
      isNotification: false,
      timeNotification: '12:00',
      wordToExploreCount: 10,
      day: 1,
      flameCount: 1,
      selectedCategory: '300 common words');

  static const defaultCategory = '300 common words';
}

