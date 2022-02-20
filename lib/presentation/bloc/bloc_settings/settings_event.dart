part of 'settings_bloc.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {

  factory SettingsEvent.loadLightTheme() = LoadLightTheme;

  factory SettingsEvent.loadDarkTheme() = LoadDarkTheme;

}
