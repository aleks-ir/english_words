part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  factory SettingsState.initState() = _InitState;

  factory SettingsState.content() = _Content;
}
