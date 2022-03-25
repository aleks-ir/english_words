import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/words/fetch_all_words_usecase.dart';

import 'mock_word_repository.mocks.dart';

void main() {
  late FetchAllWordsUsecase usecase;
  late MockWordRepository mockRepository;

  setUp(() {
    mockRepository = MockWordRepository();
    usecase = FetchAllWordsUsecase(mockRepository);
  });

  final tWordsDto = [
    WordDto(title: "title 1"),
    WordDto(title: "title 2"),
  ].toList();
  final tWord = [
    Word(title: "title 1"),
    Word(title: "title 2"),
  ].toList();

  test(
    'should get all words from the repository',
    () async {
      when(mockRepository.getAllWords()).thenAnswer((_) => tWordsDto);

      final result = await usecase();
      final resultWords = result.getOrElse(() => []);

      expect(resultWords, tWord);
      verify(mockRepository.getAllWords());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
