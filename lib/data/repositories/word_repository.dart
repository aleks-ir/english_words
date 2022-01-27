import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/datasources/database_local.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl({required this.database});

  final DatabaseLocal database;

  @override
  Future addWord(String id, WordDto word) async {
    try {
      await database.add(id, word);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteWord(String id) async {
    try {
      await database.delete(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  List<WordDto> getAllWords() {
    try {
      final notesDto =
          database.getAll().map((word) => word as WordDto).toList();
      return notesDto;
    } catch (_) {
      rethrow;
    }
  }
}
