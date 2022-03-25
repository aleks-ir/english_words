import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/words/create_word_usecase.dart';

import 'mock_word_repository.mocks.dart';

void main() {
  late CreateWordUsecase usecase;
  late MockWordRepository mockRepository;

  setUp(() {
    mockRepository = MockWordRepository();
    usecase = CreateWordUsecase(mockRepository);
  });

  final tWordDto = WordDto(title: "title");
  final tExpected =
      Success(message: '${tWordDto.title} successfully created!');

  test(
    'should create word in the repository',
    () async {
      when(mockRepository.addWord(tWordDto)).thenAnswer((_) async => Future);

      final result = await usecase(tWordDto.toDomain());

      final resultWord = result.getOrElse(() => Success(message: ''));

      expect(resultWord.message, tExpected.message);
      verify(mockRepository.addWord(tWordDto));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
