import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';
import 'package:word_study_puzzle/domain/usecases/settings/settings.dart';
import 'package:word_study_puzzle/presentation/theme_switcher.dart';

part 'settings_bloc.freezed.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final FetchSettingsUsecase fetchSettingsUsecase;
  final UpdateSettingsUsecase updateSettingsUsecase;
  final ThemeSwitcher theme;

  late Settings settings;

  SettingsBloc(
      {required this.fetchSettingsUsecase, required this.updateSettingsUsecase, required this.theme})
      : super(SettingsState.initState());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    yield* event.map(
      fetchSettings: _fetchSettings,
      changeTheme: _changeTheme,
      changeWordCount: _changeWordCount,
      changeVibration: _changeVibration,
      changeNotification: _changeNotification,
    );
  }

  Stream<SettingsState> _fetchSettings(FetchSettings event) async* {
    final errorOrSettings = await fetchSettingsUsecase();
    yield errorOrSettings.fold(
            (error) => SettingsState.error(error.message), (settings) {
      this.settings = settings;
      return SettingsState.loaded(settings);
    });
  }

  Stream<SettingsState> _changeTheme(ChangeTheme event) async* {
    theme.changeTheTheme(event.darkThemeIsEnabled);
    settings.darkThemeIsEnabled = event.darkThemeIsEnabled;
    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error =
      errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield SettingsState.error(error.message);
    }
    yield SettingsState.initState();
  }

  Stream<SettingsState> _changeWordCount(ChangeWordCount event) async* {
    settings.wordToExploreCount = event.wordCount;
    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error =
      errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield SettingsState.error(error.message);
    }
  }

  Stream<SettingsState> _changeVibration(ChangeVibration event) async* {
    settings.isVibration = event.isVibration;
    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error =
      errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield SettingsState.error(error.message);
    }
    yield SettingsState.initState();
  }

  Stream<SettingsState> _changeNotification(
      ChangeNotification event) async* {
    settings.isNotification = event.isNotification;
    if(event.isNotification){
      settings.timeNotification = event.timeNotification;
    }
    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error =
      errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield SettingsState.error(error.message);
    }
    yield SettingsState.initState();
  }
}
