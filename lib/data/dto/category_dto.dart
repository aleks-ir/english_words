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
  final List<WordDto> wordList;
  @HiveField(4)
  final int indexIconAsset;
  @HiveField(5)
  final String description;

  CategoryDto({
    required this.title,
    this.openingCost = 0,
    this.isEditable = true,
    this.wordList = const [],
    this.indexIconAsset = 0,
    this.description = '',
  });

  factory CategoryDto.fromDomain(Category category) {
    return CategoryDto(
      title: category.title,
      openingCost: category.openingCost,
      isEditable: category.isEditable,
      wordList:
          category.wordList.map((word) => WordDto.fromDomain(word)).toList(),
      indexIconAsset: category.iconAssetIndex,
      description: category.description
    );
  }

  Category toDomain() {
    return Category(
        title: title,
        openingCost: openingCost,
        isEditable: isEditable,
        wordList: wordList.map((word) => word.toDomain()).toList(),
        iconAssetIndex: indexIconAsset,
        description: description);
  }

  bool get validCategory => title.isNotEmpty == true;

  CategoryDto copyWith({
    String? title,
    int? openingCost,
    bool? isEditable,
    List<WordDto>? wordList,
    int? indexIconAsset,
    String? description,
  }) {
    return CategoryDto(
        title: title ?? this.title,
        openingCost: openingCost ?? this.openingCost,
        isEditable: isEditable ?? this.isEditable,
        wordList: wordList ?? this.wordList,
        indexIconAsset: indexIconAsset ?? this.indexIconAsset,
        description: description ?? this.description

    );
  }

  @override
  String toString() {
    return 'CategoryDto{title: $title, openingCost: $openingCost, isEditable: $isEditable, wordList: $wordList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDto &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          openingCost == other.openingCost &&
          isEditable == other.isEditable;

  @override
  int get hashCode =>
      title.hashCode ^ openingCost.hashCode ^ isEditable.hashCode;
}
