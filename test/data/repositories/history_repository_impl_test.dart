import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/data/dto/history_dto.dart';
import 'package:word_study_puzzle/data/repositories/history_repository_impl.dart';
import 'package:word_study_puzzle/domain/repositories/history_repository.dart';

import 'mock_database.dart';



void main() {
  late HistoryRepository repository;
  late MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    repository = HistoryRepositoryImpl(historyDatabase: mockDatabase);
  });

  final tHistory = HistoryDto(data: '', wordExploredCount: 0, wasAllWordsExplored: false);


  test(
    'should get history by id from the database',
        () async {
      when(mockDatabase.get('id')).thenAnswer((_) => tHistory);

      final result = await repository.getHistory('id');

      expect(result, tHistory);
      verify(
          mockDatabase.get('id'));
      verifyNoMoreInteractions(mockDatabase);
    },
  );


}


