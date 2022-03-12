import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/words/delete_word_usecase.dart';

import 'mock_word_repository.mocks.dart';

void main() {
  late DeleteWordUsecase usecase;
  late MockWordRepository mockRepository;

  setUp(() {
    mockRepository = MockWordRepository();
    usecase = DeleteWordUsecase(mockRepository);
  });

  final tWordDto = WordDto(title: "title");
  final tExpected =
  Success(message: '${tWordDto.title} successfully delete!');

  test(
    'should delete word in the repository',
        () async {
      when(mockRepository.deleteWord(tWordDto)).thenAnswer((_) async => Future);

      final result = await usecase(tWordDto.toDomain());

      final resultWord = result.getOrElse(() => Success(message: ''));

      expect(resultWord.message, tExpected.message);
      verify(mockRepository.deleteWord(tWordDto));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
