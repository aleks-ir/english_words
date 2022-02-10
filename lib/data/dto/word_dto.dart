import 'package:hive/hive.dart';
import 'package:words_3000_puzzle/common/constants/word_status.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';

part 'word_dto.g.dart';

@HiveType(typeId: 4)
class WordDto {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> imageLinksList;
  @HiveField(2)
  final List<String> definitionList;
  @HiveField(3)
  final List<String> examplesList;
  @HiveField(4)
  final String pronunciation;
  @HiveField(5)
  final String status;
  @HiveField(6)
  final String studyDate;

  const WordDto(
      {required this.title,
      this.imageLinksList = const [],
      this.definitionList = const [],
      this.examplesList = const [],
      this.pronunciation = '',
      this.status = WordStatus.unexplored,
      this.studyDate = ''});

  factory WordDto.fromDomain(Word word) {
    return WordDto(
        title: word.title,
        imageLinksList: word.imageLinksList,
        definitionList: word.definitionList,
        examplesList: word.examplesList,
        pronunciation: word.pronunciation,
        status: word.status,
        studyDate: word.studyDate);
  }

  Word toDomain() {
    return Word(
        title: title,
        imageLinksList: imageLinksList,
        definitionList: definitionList,
        examplesList: examplesList,
        pronunciation: pronunciation,
        status: status,
        studyDate: studyDate);
  }

  bool get validWord => title.isNotEmpty == true;

  WordDto copyWith({
    String? title,
    List<String>? imageLinksList,
    List<String>? definitionList,
    List<String>? examplesList,
    String? pronunciation,
    String? status,
    String? studyDate,
  }) {
    return WordDto(
        title: title ?? this.title,
        imageLinksList: imageLinksList ?? this.imageLinksList,
        definitionList: definitionList ?? this.definitionList,
        examplesList: examplesList ?? this.examplesList,
        pronunciation: pronunciation ?? this.pronunciation,
        status: status ?? this.status,
        studyDate: studyDate ?? this.studyDate);
  }
}
