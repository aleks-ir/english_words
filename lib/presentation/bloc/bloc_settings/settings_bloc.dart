import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState.initState());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    yield* event.map(
      loadLightTheme: _loadLightTheme,
      loadDarkTheme: _loadDarkTheme,
    );
  }

  Stream<SettingsState> _loadLightTheme(LoadLightTheme event) async* {
    print("LoadLightTheme");
    yield SettingsState.initState();
  }

  Stream<SettingsState> _loadDarkTheme(LoadDarkTheme event) async* {
    print("LoadDarkTheme");
  }

}
