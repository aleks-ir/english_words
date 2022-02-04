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
  final bool isOpened;
  @HiveField(3)
  final bool isModifiable;
  @HiveField(4)
  final List<WordDto> wordsList;

  const CategoryDto({
    required this.title,
    required this.openingCost,
    required this.isOpened,
    required this.isModifiable,
    required this.wordsList,
  });

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      title: category.title,
      openingCost: category.openingCost,
      isOpened: category.isOpened,
      isModifiable: category.isModifiable,
      wordsList:
          category.wordsList.map((word) => WordDto.fromDomain(word)).toList(),
    );
  }

  Category toDomain() {
    return Category(
      title: title,
      openingCost: openingCost,
      isOpened: isOpened,
      isModifiable: isModifiable,
      wordsList: wordsList.map((word) => word.toDomain()).toList() ?? [],
    );
  }

  bool get validCategory => title.isNotEmpty == true;

  CategoryDto copyWith({
    String? title,
    int? openingCost,
    bool? isOpened,
    bool? isModifiable,
    List<WordDto>? wordsList,
  }) {
    return CategoryDto(
      title: title ?? this.title,
      openingCost: openingCost ?? this.openingCost,
      isOpened: isOpened ?? this.isOpened,
      isModifiable: isModifiable ?? this.isModifiable,
      wordsList: wordsList ?? this.wordsList
    );
  }
}
