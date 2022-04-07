part of 'stats_bloc.dart';

@freezed
abstract class StatsState with _$StatsState {
  factory StatsState.initState() = _InitStatsState;

  factory StatsState.loaded(Map<int, List<History>> historiesByMonth) = _HistoriesLoaded;

  factory StatsState.empty() = _Empty;

  factory StatsState.error(String massage) = _HistoriesError;
}
