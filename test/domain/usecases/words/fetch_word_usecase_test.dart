import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';
import 'package:words_3000_puzzle/domain/usecases/words/fetch_word_usecase.dart';

import 'mock_word_repository.mocks.dart';

void main() {
  late FetchWordUsecase usecase;
  late MockWordRepository mockRepository;

  setUp(() {
    mockRepository = MockWordRepository();
    usecase = FetchWordUsecase(mockRepository);
  });

  final tWordDto = WordDto(title: "title");

  test(
    'should get word from the repository',
    () async {
      when(mockRepository.getWord(tWordDto.title))
          .thenAnswer((_) => tWordDto);

      final result = await usecase(tWordDto.title);

      final resultWord = result.getOrElse(
          () => tWordDto.copyWith(title: '').toDomain());

      expect(resultWord, tWordDto.toDomain());
      verify(mockRepository.getWord(tWordDto.title));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
