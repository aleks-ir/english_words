part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  factory SettingsState.initState() = _InitSettingsState;

  factory SettingsState.loaded(Settings settings) = _SettingsLoaded;

  factory SettingsState.error(String message) = _SettingsError;
}
