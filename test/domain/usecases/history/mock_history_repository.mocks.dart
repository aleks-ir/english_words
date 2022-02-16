// Mocks generated by Mockito 5.1.0 from annotations
// in words_3000_puzzle/test/domain/usecases/history/mock_history_repository.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:words_3000_puzzle/data/dto/history_dto.dart' as _i2;
import 'package:words_3000_puzzle/domain/repositories/history_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeHistoryDto_0 extends _i1.Fake implements _i2.HistoryDto {}

/// A class which mocks [HistoryRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHistoryRepository extends _i1.Mock implements _i3.HistoryRepository {
  MockHistoryRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.HistoryDto> getAllHistories() =>
      (super.noSuchMethod(Invocation.method(#getAllHistories, []),
          returnValue: <_i2.HistoryDto>[]) as List<_i2.HistoryDto>);
  @override
  _i4.Future<_i2.HistoryDto> getHistory(String? date) =>
      (super.noSuchMethod(Invocation.method(#getHistory, [date]),
              returnValue: Future<_i2.HistoryDto>.value(_FakeHistoryDto_0()))
          as _i4.Future<_i2.HistoryDto>);
  @override
  _i4.Future<dynamic> addUpdateHistory(String? date, _i2.HistoryDto? history) =>
      (super.noSuchMethod(Invocation.method(#addUpdateHistory, [date, history]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
}