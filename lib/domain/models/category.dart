import 'package:word_study_puzzle/domain/models/word.dart';

class Category {

  String title;
  int openingCost;
  bool isEditable;
  List<Word> wordList;
  int iconAssetIndex;
  String description;

  Category({
    required this.title,
    this.openingCost = 0,
    this.isEditable = true,
    this.wordList = const[],
    this.iconAssetIndex = 0,
    this.description = '',
  });

  @override
  String toString() {
    return 'Category{title: $title, openingCost: $openingCost, isEditable: $isEditable, wordList: $wordList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          openingCost == other.openingCost &&
          isEditable == other.isEditable;

  @override
  int get hashCode =>
      title.hashCode ^
      openingCost.hashCode ^
      isEditable.hashCode;
}