import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constants.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  factory SettingsState.initState() = _InitState;

  factory SettingsState.content(Themes theme) = _Content;
}
