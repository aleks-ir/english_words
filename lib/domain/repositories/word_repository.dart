
import 'package:word_study_puzzle/data/dto/word_dto.dart';

abstract class WordRepository {
  List<WordDto> getAllWords();
  Future<WordDto> getWord(String title);
  Future<WordDto> getRandomUnexploredWord(List<String>? exclusionaryList);
  Future addWord(WordDto word);
  Future updateWord(WordDto word);
  Future deleteWord(WordDto word);
}
