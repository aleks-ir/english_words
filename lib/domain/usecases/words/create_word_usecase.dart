import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/common/exception.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/success.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class CreateWordUsecase {
  final WordRepository repository;
  CreateWordUsecase(this.repository);

  Future<Either<Error, Success>> call(Word word) async {
    try {
      final wordDto = WordDto.fromDomain(word);

      if (!wordDto.validWord) {
        return left(
          Error(message: 'Failed to add word "${word.title}", title should not empty.'),
        );
      }
      await repository.addWord(wordDto);
      return right(Success(message: 'Word "${word.title}" successfully created!'));
    } catch (e) {
      if (e is noUniquenessException) {
        return left(
          Error(message: 'Failed to add word "${word.title}", title is not unique'),
        );
      }
      return left(
        Error(message: 'Failed to add word "${word.title}".'),
      );
    }

  }
}

