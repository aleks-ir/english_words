part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState.initState() = _InitState;
}
