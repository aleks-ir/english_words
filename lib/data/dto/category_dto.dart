import 'package:hive/hive.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/models/category.dart';

part 'category_dto.g.dart';

@HiveType(typeId: 3)
class CategoryDto {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int openingDay;
  @HiveField(2)
  final bool isEditable;
  @HiveField(3)
  final List<WordDto> wordList;

  CategoryDto({
    required this.title,
    this.openingDay = 0,
    this.isEditable = true,
    this.wordList = const[],
  });

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      title: category.title,
      openingDay: category.openingDay,
      isEditable: category.isEditable,
      wordList:
          category.wordList.map((word) => WordDto.fromDomain(word)).toList(),
    );
  }

  Category toDomain() {
    return Category(
      title: title,
      openingDay: openingDay,
      isEditable: isEditable,
      wordList: wordList.map((word) => word.toDomain()).toList(),
    );
  }

  bool get validCategory => title.isNotEmpty == true;

  CategoryDto copyWith({
    String? title,
    int? openingDay,
    bool? isEditable,
    List<WordDto>? wordList,
  }) {
    return CategoryDto(
      title: title ?? this.title,
      openingDay: openingDay ?? this.openingDay,
      isEditable: isEditable ?? this.isEditable,
      wordList: wordList ?? this.wordList
    );
  }

  @override
  String toString() {
    return 'CategoryDto{title: $title, openingCost: $openingDay, isEditable: $isEditable, wordList: $wordList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDto &&
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
