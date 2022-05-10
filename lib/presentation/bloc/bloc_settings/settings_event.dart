part of 'settings_bloc.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {

  factory SettingsEvent.fetchSettings() = FetchSettings;

  factory SettingsEvent.changeTheme(bool darkThemeIsEnabled) = ChangeTheme;

  factory SettingsEvent.changeWordCount(int wordCount) = ChangeWordCount;

  factory SettingsEvent.changeVibration(bool isVibration) = ChangeVibration;

  factory SettingsEvent.changeViewMode(bool viewCarouselIsEnabled) = ChangeViewMode;

  factory SettingsEvent.changeNotification(bool isNotification, String timeNotification) = ChangeNotification;
}
