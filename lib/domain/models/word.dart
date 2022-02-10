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
}