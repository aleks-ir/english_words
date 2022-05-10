
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';

class Initial{
  static final pathCategoriesMap = {
    'assets/categories/three_thousand_words.json' : Category(title: '3000 words', openingCost: 0, isEditable: false, wordList: [], iconAssetIndex: 5,
        description: 'This is words :) qqqqqqq hfdjdfhjfd hdfjdhfjhd hfdjdjfd shdjsjhj hfjddhjfd jaskjasj hfdjhfdjd hasjsahjh' ),
    'assets/categories/human_body.json' : Category(title: 'Human body', openingCost: 1, isEditable: false, wordList: [], iconAssetIndex: 2,
        description: 'Human body qqqqqqq1111111122222222kdfgl kldfgldfgl kldfgldfglfdgk kdlfdflk'),
    'assets/categories/food.json' : Category(title: 'Food', openingCost: 1, isEditable: false, wordList: [], iconAssetIndex: 7,
        description: 'Food qqqqqqq')
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
      selectedCategory: '3000 words');

  static const defaultCategory = '3000 words';
}

