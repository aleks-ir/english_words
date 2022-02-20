import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/success.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class DeleteWordUsecase {
  final WordRepository repository;
  DeleteWordUsecase(this.repository);

  Future<Either<Error, Success>> call(Word word) async {
    try {
      final wordDto = WordDto.fromDomain(word);
      await repository.deleteWord(wordDto);
      return right(Success(message: 'Word "${word.title}" successfully delete!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to delete word "${word.title}".'),
      );
    }

  }
}

