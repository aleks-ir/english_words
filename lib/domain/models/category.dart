import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';

class Category {

  final String title;
  final int openingCost;
  final bool isOpened;
  final bool isModifiable;
  final List<Word> wordsList;

  Category({
    required this.title,
    required this.openingCost,
    required this.isOpened,
    required this.isModifiable,
    required this.wordsList
  });
}