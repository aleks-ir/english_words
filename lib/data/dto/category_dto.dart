import 'package:hive/hive.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/models/category.dart';

part 'category_dto.g.dart';

@HiveType(typeId: 3)
class CategoryDto {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int openingCost;
  @HiveField(2)
  final bool isEditable;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final int day;
  @HiveField(5)
  final List<WordDto> wordList;

  CategoryDto({
    required this.title,
    this.openingCost = 0,
    this.isEditable = true,
    this.date = '',
    this.day = 0,
    this.wordList = const[],
  });

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      title: category.title,
      openingCost: category.openingCost,
      isEditable: category.isEditable,
      date: category.date,
      day: category.day,
      wordList:
          category.wordList.map((word) => WordDto.fromDomain(word)).toList(),
    );
  }

  Category toDomain() {
    return Category(
      title: title,
      openingCost: openingCost,
      isEditable: isEditable,
      date: date,
      day: day,
      wordList: wordList.map((word) => word.toDomain()).toList(),
    );
  }

  bool get validCategory => title.isNotEmpty == true;

  CategoryDto copyWith({
    String? title,
    int? openingCost,
    bool? isEditable,
    String? date,
    int? day,
    List<WordDto>? wordList,
  }) {
    return CategoryDto(
      title: title ?? this.title,
      openingCost: openingCost ?? this.openingCost,
      isEditable: isEditable ?? this.isEditable,
      date: date ?? this.date,
      day: day ?? this.day,
      wordList: wordList ?? this.wordList
    );
  }

  @override
  String toString() {
    return 'CategoryDto{title: $title, openingCost: $openingCost, isEditable: $isEditable, date: $date, day: $day, wordList: $wordList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDto &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          openingCost == other.openingCost &&
          isEditable == other.isEditable &&
          date == other.date &&
          day == other.day;

  @override
  int get hashCode =>
      title.hashCode ^
      openingCost.hashCode ^
      isEditable.hashCode ^
      date.hashCode ^
      day.hashCode;
}
