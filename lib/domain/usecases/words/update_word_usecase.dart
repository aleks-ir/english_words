import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/repositories/word_repository.dart';

class UpdateWordUsecase {
  final WordRepository repository;
  UpdateWordUsecase(this.repository);

  Future<Either<Error, Success>> call(Word word) async {
    try {
      final wordDto = WordDto.fromDomain(word);
      await repository.updateWord(wordDto);
      return right(Success(message: '${word.title} successfully updated!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to update ${word.title}'),
      );
    }

  }
}

