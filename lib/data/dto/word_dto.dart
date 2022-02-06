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
  final List<String> meaningList;
  @HiveField(3)
  final List<String> examplesList;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final String studyDate;

  const WordDto(
      {required this.title,
      this.imageLinksList = const [],
      this.meaningList = const [],
      this.examplesList = const [],
      this.status = WordStatus.unexplored,
      this.studyDate = ''});

  factory WordDto.fromDomain(Word word) {
    return WordDto(
        title: word.title,
        imageLinksList: word.imageLinksList,
        meaningList: word.meaningList,
        examplesList: word.examplesList,
        status: word.status,
        studyDate: word.studyDate);
  }

  Word toDomain() {
    return Word(
      title: title,
      imageLinksList: imageLinksList,
      meaningList: meaningList,
      examplesList: examplesList,
      status: status,
      studyDate: studyDate
    );
  }

  bool get validWord => title.isNotEmpty == true;

  WordDto copyWith({
    String? title,
    List<String>? imageLinksList,
    List<String>? meaningList,
    List<String>? examplesList,
    String? status,
    String? studyDate,
  }) {
    return WordDto(
      title: title ?? this.title,
        imageLinksList: imageLinksList ?? this.imageLinksList,
      meaningList: meaningList ?? this.meaningList,
      examplesList: examplesList ?? this.examplesList,
      status: status ?? this.status,
      studyDate: studyDate ?? this.studyDate
    );
  }
}
