import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/domain/usecases/words/fetch_study_word_usecase.dart';

import 'mock_word_repository.mocks.dart';

void main() {
  late FetchUnexploredWordUsecase usecase;
  late MockWordRepository mockRepository;

  setUp(() {
    mockRepository = MockWordRepository();
    usecase = FetchUnexploredWordUsecase(mockRepository);
  });

  final tWordDto = WordDto(title: "title");

  test(
    'should get random unexplored word from the repository',
    () async {
      when(mockRepository.getRandomUnexploredWord())
          .thenAnswer((_) => tWordDto);

      final result = await usecase();

      final resultWord = result.getOrElse(
          () => tWordDto.copyWith(title: '').toDomain());

      expect(resultWord, tWordDto.toDomain());
      verify(mockRepository.getRandomUnexploredWord());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
