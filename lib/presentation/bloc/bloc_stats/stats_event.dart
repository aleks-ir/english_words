part of 'stats_bloc.dart';

@freezed
abstract class StatsEvent with _$StatsEvent {

  factory StatsEvent.fetchHistory() = FetchHistory;

  factory StatsEvent.fetchHistoriesByMonths() = FetchHistoriesByMonths;

}
