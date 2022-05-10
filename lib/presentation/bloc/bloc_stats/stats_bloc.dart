import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/domain/usecases/history/fetch_all_histories_usecase.dart';
import 'package:word_study_puzzle/domain/usecases/history/fetch_history_usecase.dart';

part 'stats_bloc.freezed.dart';
part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  DateTime currentDate = DateTime.now();
  double exploredRate = 0;
  bool awardWasReceived = false;

  final FetchAllHistoriesUsecase fetchAllHistoriesUsecase;
  final FetchHistoryUsecase fetchHistoryUsecase;

  StatsBloc({
    required this.fetchAllHistoriesUsecase,
    required this.fetchHistoryUsecase,
  }) : super(StatsState.initState());

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async* {
    yield* event.map(
      fetchHistory: _fetchHistory,
      fetchHistoriesByMonths: _fetchHistoriesByMonths,
    );
  }

  Stream<StatsState> _fetchHistory(FetchHistory event) async* {
    final date = DateFormat('yyyy-MM-dd').format(currentDate);
    final errorOrHistory = fetchHistoryUsecase(date);
    if (errorOrHistory.isRight()) {
      final history = errorOrHistory.getOrElse(() => History(date: ''));
      awardWasReceived = history.awardWasReceived;
      exploredRate = _countExploredRate(history);
    }
  }

  double _countExploredRate(History history) {
    if (history.wordExploringCount == 0) {
      return 0;
    } else {
      return (history.wordExploringCount + history.wordRepeatingCount) /
          (history.wordToExploreCount + history.wordRepeatingCount);
    }
  }

  Stream<StatsState> _fetchHistoriesByMonths(
      FetchHistoriesByMonths event) async* {
    final errorOrSuccess = fetchAllHistoriesUsecase();
    yield errorOrSuccess.fold((error) => StatsState.error(error.message),
        (allHistories) {
      if (allHistories.isEmpty) {
        return StatsState.empty();
      } else {
        final historiesByMonths = _selectHistoriesByMonth(allHistories);
        return StatsState.loaded(historiesByMonths);
      }
    });
  }

  Map<int, List<History>> _selectHistoriesByMonth(List<History> allHistories) {
    final Map<int, List<History>> historiesByMonths = {};
    for (var history in allHistories) {
      final date = DateTime.parse(history.date);
      if (currentDate.year == date.year) {
        if (historiesByMonths[date.month] != null) {
          historiesByMonths[date.month]?.add(history);
        } else {
          historiesByMonths[date.month] = [history];
        }
      }
    }
    return historiesByMonths;
  }
}
