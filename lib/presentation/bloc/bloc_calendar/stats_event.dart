part of 'stats_bloc.dart';

@freezed
abstract class StatsEvent with _$StatsEvent {

  factory StatsEvent.initExploredRate() = InitExploredRate;

  factory StatsEvent.fetchHistoriesByMonths() = FetchHistoriesByMonths;

}
