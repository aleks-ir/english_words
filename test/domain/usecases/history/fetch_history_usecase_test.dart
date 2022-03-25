import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/history_dto.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/usecases/history/fetch_history_usecase.dart';

import 'mock_history_repository.mocks.dart';


void main() {
  late FetchHistoryUsecase usecase;
  late MockHistoryRepository mockRepository;

  setUp(() {
    mockRepository = MockHistoryRepository();
    usecase = FetchHistoryUsecase(mockRepository);
  });

  final tHistoryDto =
      HistoryDto(data: '2021-01-01');

  test(
    'should get history by date from the repository',
    () async {
      when(mockRepository.getHistory(tHistoryDto.data))
          .thenAnswer((_) async => tHistoryDto);

      final result = await usecase(tHistoryDto.data);

      final resultHistory = result.getOrElse(
          () => History(data: '', wordCount: 0, wasWordsExplored: false));

      expect(resultHistory, tHistoryDto.toDomain());
      verify(mockRepository.getHistory(tHistoryDto.data));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
