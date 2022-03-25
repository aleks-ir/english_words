part of 'calendar_bloc.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  factory CalendarState.initState() = _InitCalendarState;

}
