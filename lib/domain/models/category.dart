import 'package:words_3000_puzzle/domain/models/word.dart';

class Category {

  String title;
  int openingCost;
  bool isEditable;
  String date;
  int day;
  List<Word> wordList;

  Category({
    required this.title,
    this.openingCost = 0,
    this.isEditable = true,
    this.date = '',
    this.day = 0,
    this.wordList = const[],
  });

  @override
  String toString() {
    return 'Category{title: $title, openingCost: $openingCost, isEditable: $isEditable, date: $date, day: $day, wordList: $wordList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          openingCost == other.openingCost &&
          isEditable == other.isEditable &&
          date == other.date &&
          day == other.day &&
          wordList == other.wordList;

  @override
  int get hashCode =>
      title.hashCode ^
      openingCost.hashCode ^
      isEditable.hashCode ^
      date.hashCode ^
      day.hashCode ^
      wordList.hashCode;
}