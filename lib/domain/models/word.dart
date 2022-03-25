import '../../common/constants/word_status.dart';

class Word {

  String title;
  List<String> imageLinksList;
  List<String> definitionList;
  List<String> examplesList;
  String pronunciation;
  String status;
  int repetitionDay;

  Word({
    required this.title,
    this.imageLinksList = const [],
    this.definitionList = const [],
    this.examplesList = const [],
    this.pronunciation = '',
    this.status = WordStatus.unexplored,
    this.repetitionDay = 0,
  });

  @override
  String toString() {
    return 'Word{title: $title, imageLinksList: $imageLinksList, definitionList: $definitionList, examplesList: $examplesList, pronunciation: $pronunciation, status: $status, studyDate: $repetitionDay}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Word &&
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