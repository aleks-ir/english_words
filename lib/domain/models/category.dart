import 'package:word_study_puzzle/domain/models/word.dart';

class Category {

  String title;
  int openingDay;
  bool isEditable;
  List<Word> wordList;

  Category({
    required this.title,
    this.openingDay = 0,
    this.isEditable = true,
    this.wordList = const[],
  });

  @override
  String toString() {
    return 'Category{title: $title, openingCost: $openingDay, isEditable: $isEditable, wordList: $wordList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          openingDay == other.openingDay &&
          isEditable == other.isEditable;

  @override
  int get hashCode =>
      title.hashCode ^
      openingDay.hashCode ^
      isEditable.hashCode;
}