import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/models/errors.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/domain/repositories/word_repository.dart';

class AddWordUsecase {
  final WordRepository _repository;
  AddWordUsecase(this._repository);
  final _uuid = const Uuid();

  Future<Either<WordError, int>> call(Word word) async {
    try {
      final wordDto = WordDto.fromDomain(word);

      if (!wordDto.validWord) {
        return left(
          WordError(message: 'Failed to add word, Title should not empty.'),
        );
      }

      await _repository.addWord(_uuid.v4(), wordDto.copyWith());
      return right(1);
    } catch (e) {
      return left(
        WordError(message: 'Failed to load words, please try again.'),
      );
    }

  }
}

