import '../../common/constants/word_status.dart';

class Word {

  final String title;
  final List<String> imageLinksList;
  final List<String> definitionList;
  final List<String> examplesList;
  final String pronunciation;
  final String status;
  final String studyDate;

  Word({
    required this.title,
    this.imageLinksList = const [],
    this.definitionList = const [],
    this.examplesList = const [],
    this.pronunciation = '',
    this.status = WordStatus.unexplored,
    this.studyDate = '',
  });

  @override
  String toString() {
    return 'Word{title: $title, imageLinksList: $imageLinksList, definitionList: $definitionList, examplesList: $examplesList, pronunciation: $pronunciation, status: $status, studyDate: $studyDate}';
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
          studyDate == other.studyDate;

  @override
  int get hashCode =>
      title.hashCode ^
      imageLinksList.hashCode ^
      definitionList.hashCode ^
      examplesList.hashCode ^
      pronunciation.hashCode ^
      status.hashCode ^
      studyDate.hashCode;
}