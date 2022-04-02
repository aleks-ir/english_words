import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/history_dto.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/usecases/history/fetch_all_histories_usecase.dart';

import 'mock_history_repository.mocks.dart';


void main() {
  late FetchAllHistoriesUsecase usecase;
  late MockHistoryRepository mockRepository;

  setUp(() {
    mockRepository = MockHistoryRepository();
    usecase = FetchAllHistoriesUsecase(mockRepository);
  });

  final tHistoriesDto = [HistoryDto(date: '2021-01-01'),
    HistoryDto(date: '2021-01-02')].toList();
  final tHistories = [History(date: '2021-01-01'),
    History(date: '2021-01-02')].toList();

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

