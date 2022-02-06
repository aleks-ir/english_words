import 'package:hive/hive.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';

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
  final List<WordDto> wordList;

  const CategoryDto({
    required this.title,
    required this.openingCost,
    required this.isEditable,
    required this.wordList,
  });

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      title: category.title,
      openingCost: category.openingCost,
      isEditable: category.isEditable,
      wordList:
          category.wordList.map((word) => WordDto.fromDomain(word)).toList(),
    );
  }

  Category toDomain() {
    return Category(
      title: title,
      openingCost: openingCost,
      isEditable: isEditable,
      wordList: wordList.map((word) => word.toDomain()).toList() ?? [],
    );
  }

  bool get validCategory => title.isNotEmpty == true;

  CategoryDto copyWith({
    String? title,
    int? openingCost,
    bool? isEditable,
    List<WordDto>? wordList,
  }) {
    return CategoryDto(
      title: title ?? this.title,
      openingCost: openingCost ?? this.openingCost,
      isEditable: isEditable ?? this.isEditable,
      wordList: wordList ?? this.wordList
    );
  }
}
