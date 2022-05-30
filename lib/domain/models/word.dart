import 'package:word_study_puzzle/common/constants/word_status.dart';

class Word {

  String title;
  List<String> imageUrlList;
  List<String> definitionList;
  List<String> examplesList;
  String pronunciation;
  String status;
  int repetitionDay;
  int repetitionNum;
  Map<int, String>  letterMap;
  List<String>  selectedLetterList;
  bool? isAnswered;
  bool isOpened;
  bool isLoaded;

  Word({
    required this.title,
    this.imageUrlList = const [],
    this.definitionList = const [],
    this.examplesList = const [],
    this.pronunciation = '',
    this.status = WordStatus.unexplored,
    this.repetitionDay = 0,
    this.repetitionNum = 0,
    this.letterMap = const {},
    this.selectedLetterList = const [],
    this.isAnswered,
    this.isOpened = false,
    this.isLoaded = true,
  });

  @override
  String toString() {
    return 'Word{title: $title, imageUrlList: $imageUrlList, definitionList: $definitionList, examplesList: $examplesList, pronunciation: $pronunciation, status: $status, repetitionDay: $repetitionDay, letterMap: $letterMap, selectedLetterList: $selectedLetterList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Word &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          imageUrlList == other.imageUrlList &&
          definitionList == other.definitionList &&
          examplesList == other.examplesList &&
          pronunciation == other.pronunciation &&
          status == other.status &&
          repetitionDay == other.repetitionDay &&
          letterMap == other.letterMap &&
          selectedLetterList == other.selectedLetterList;

  @override
  int get hashCode =>
      title.hashCode ^
      imageUrlList.hashCode ^
      definitionList.hashCode ^
      examplesList.hashCode ^
      pronunciation.hashCode ^
      status.hashCode ^
      repetitionDay.hashCode ^
      letterMap.hashCode ^
      selectedLetterList.hashCode;
}