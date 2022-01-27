import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_settings/settings_event.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_settings/settings_state.dart';

import '../../../common/constants.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late Themes theme = Themes.light;
  SettingsBloc() : super(SettingsState.initState());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    yield* event.map(
      loadLightTheme: _loadLightTheme,
      loadDarkTheme: _loadDarkTheme,
    );
  }

  Stream<SettingsState> _loadLightTheme(LoadLightTheme event) async* {
    theme = Themes.light;
    print("LoadLightTheme");
    yield SettingsState.initState();
  }

  Stream<SettingsState> _loadDarkTheme(LoadDarkTheme event) async* {
    theme = Themes.dark;
    print("LoadDarkTheme");
    yield SettingsState.content(theme);
  }

}
