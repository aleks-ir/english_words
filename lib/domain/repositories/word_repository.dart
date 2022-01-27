
import 'package:words_3000_puzzle/data/dto/word_dto.dart';

abstract class WordRepository {
  List<WordDto> getAllWords();
  Future addWord(String id, WordDto word);
  Future deleteWord(String id);
}
