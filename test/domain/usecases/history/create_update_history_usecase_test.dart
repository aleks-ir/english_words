import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/history_dto.dart';
import 'package:word_study_puzzle/domain/models/success.dart';
import 'package:word_study_puzzle/domain/usecases/history/create_update_history_usecase.dart';

import 'mock_history_repository.mocks.dart';


void main() {
  late CreateUpdateHistoryUsecase usecase;
  late MockHistoryRepository mockRepository;

  setUp(() {
    mockRepository = MockHistoryRepository();
    usecase = CreateUpdateHistoryUsecase(mockRepository);
  });

  final tHistoryDto = HistoryDto(
      data: '2021-01-01', wordExploredCount: 5, wasAllWordsExplored: false);
  final tExpected = Success(message: '${tHistoryDto.data} successfully updated!');
  test(
    'should add or update history in the repository',
        () async {
      when(mockRepository.addUpdateHistory(tHistoryDto.data, tHistoryDto))
          .thenAnswer((_) => Future(() => null));

      final result = await usecase(tHistoryDto.toDomain());

      final resultHistory = result.getOrElse(
              () => Success(message: ''));

      expect(resultHistory.message, tExpected.message);
      verify(mockRepository.addUpdateHistory(tHistoryDto.data, tHistoryDto));
      verifyNoMoreInteractions(mockRepository);

    },
  );
}

