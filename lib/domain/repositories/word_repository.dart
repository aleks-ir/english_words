
import 'package:words_3000_puzzle/data/dto/word_dto.dart';

abstract class WordRepository {
  List<WordDto> getAllWords();
  List<WordDto> getAllWordsByDate(String date);
  WordDto getWord(String title);
  WordDto getRandomUnexploredWord();
  Future addWord(WordDto word);
  Future updateWord(WordDto word);
  Future deleteWord(WordDto word);
}
