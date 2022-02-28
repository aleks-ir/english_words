import 'package:words_3000_puzzle/domain/models/word.dart';

class Category {

  String title;
  int openingCost;
  bool isEditable;
  List<Word> wordList;

  Category({
    required this.title,
    required this.openingCost,
    required this.isEditable,
    required this.wordList
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