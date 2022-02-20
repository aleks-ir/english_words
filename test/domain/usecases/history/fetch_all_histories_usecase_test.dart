import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/domain/models/history.dart';
import 'package:words_3000_puzzle/domain/usecases/history/fetch_all_histories_usecase.dart';

import 'mock_history_repository.mocks.dart';


void main() {
  late FetchAllHistoriesUsecase usecase;
  late MockHistoryRepository mockRepository;

  setUp(() {
    mockRepository = MockHistoryRepository();
    usecase = FetchAllHistoriesUsecase(mockRepository);
  });

  final tHistoriesDto = [HistoryDto(data: '2021-01-01', wordCount: 5, wasWordsExplored: false),
    HistoryDto(data: '2021-01-02', wordCount: 15, wasWordsExplored: true)].toList();
  final tHistories = [History(data: '2021-01-01', wordCount: 5, wasWordsExplored: false),
    History(data: '2021-01-02', wordCount: 15, wasWordsExplored: true)].toList();

  test(
    'should get all histories from the repository',
        () async {

      when(mockRepository.getAllHistories())
          .thenAnswer((_) => tHistoriesDto);

      final result = await usecase();
      final resultHistories = result.getOrElse(() => []);


      expect(resultHistories, tHistories);
      verify(mockRepository.getAllHistories());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}

