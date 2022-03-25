import 'package:hive/hive.dart';
import 'package:word_study_puzzle/common/constants/word_status.dart';
import 'package:word_study_puzzle/domain/models/word.dart';

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
  final int repetitionDay;

  WordDto(
      {required this.title,
      this.imageLinksList = const [],
      this.definitionList = const [],
      this.examplesList = const [],
      this.pronunciation = '',
      this.status = WordStatus.unexplored,
      this.repetitionDay = 0});

  factory WordDto.fromDomain(Word word) {
    return WordDto(
        title: word.title,
        imageLinksList: word.imageLinksList,
        definitionList: word.definitionList,
        examplesList: word.examplesList,
        pronunciation: word.pronunciation,
        status: word.status,
        repetitionDay: word.repetitionDay);
  }

  Word toDomain() {
    return Word(
        title: title,
        imageLinksList: imageLinksList,
        definitionList: definitionList,
        examplesList: examplesList,
        pronunciation: pronunciation,
        status: status,
        repetitionDay: repetitionDay);
  }

  bool get validWord => title.isNotEmpty == true;

  WordDto copyWith({
    String? title,
    List<String>? imageLinksList,
    List<String>? definitionList,
    List<String>? examplesList,
    String? pronunciation,
    String? status,
    int? repetitionDay,
  }) {
    return WordDto(
        title: title ?? this.title,
        imageLinksList: imageLinksList ?? this.imageLinksList,
        definitionList: definitionList ?? this.definitionList,
        examplesList: examplesList ?? this.examplesList,
        pronunciation: pronunciation ?? this.pronunciation,
        status: status ?? this.status,
        repetitionDay: repetitionDay ?? this.repetitionDay);
  }

  @override
  String toString() {
    return 'WordDto{title: $title, imageLinksList: $imageLinksList, definitionList: $definitionList, examplesList: $examplesList, pronunciation: $pronunciation, status: $status, studyDate: $repetitionDay}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordDto &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          imageLinksList == other.imageLinksList &&
          definitionList == other.definitionList &&
          examplesList == other.examplesList &&
          pronunciation == other.pronunciation &&
          status == other.status &&
          repetitionDay == other.repetitionDay;

  @override
  int get hashCode =>
      title.hashCode ^
      imageLinksList.hashCode ^
      definitionList.hashCode ^
      examplesList.hashCode ^
      pronunciation.hashCode ^
      status.hashCode ^
      repetitionDay.hashCode;
}
