import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/words/fetch_all_words_by_date_usecase.dart';

import 'mock_word_repository.mocks.dart';

void main() {
  late FetchAllWordsByDateUsecase usecase;
  late MockWordRepository mockRepository;

  setUp(() {
    mockRepository = MockWordRepository();
    usecase = FetchAllWordsByDateUsecase(mockRepository);
  });

  final tWordsDto = [
    WordDto(title: "title 1"),
    WordDto(title: "title 2"),
  ].toList();
  final tWord = [
    Word(title: "title 1"),
    Word(title: "title 2"),
  ].toList();

  const tDate = "2021-01-01";

  test(
    'should get all words from the repository',
    () async {
      when(mockRepository.getAllWordsByDate(tDate)).thenAnswer((_) => tWordsDto);

      final result = await usecase(tDate);
      final resultWords = result.getOrElse(() => []);

      expect(resultWords, tWord);
      verify(mockRepository.getAllWordsByDate(tDate));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
