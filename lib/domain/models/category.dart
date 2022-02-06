import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';

class Category {

  final String title;
  final int openingCost;
  final bool isEditable;
  final List<Word> wordList;

  const Category({
    required this.title,
    required this.openingCost,
    required this.isEditable,
    required this.wordList
  });
}