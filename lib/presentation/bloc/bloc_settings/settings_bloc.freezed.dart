// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

  FetchSettings fetchSettings() {
    return FetchSettings();
  }

  ChangeTheme changeTheme(bool darkThemeIsEnabled) {
    return ChangeTheme(
      darkThemeIsEnabled,
    );
  }

  ChangeWordCount changeWordCount(int wordCount) {
    return ChangeWordCount(
      wordCount,
    );
  }

  ChangeVibration changeVibration(bool isVibration) {
    return ChangeVibration(
      isVibration,
    );
  }

  ChangeNotification changeNotification(
      bool isNotification, String timeNotification) {
    return ChangeNotification(
      isNotification,
      timeNotification,
    );
  }
}

/// @nodoc
const $SettingsEvent = _$SettingsEventTearOff();

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSettings,
    required TResult Function(bool darkThemeIsEnabled) changeTheme,
    required TResult Function(int wordCount) changeWordCount,
    required TResult Function(bool isVibration) changeVibration,
    required TResult Function(bool isNotification, String timeNotification)
        changeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(ChangeWordCount value) changeWordCount,
    required TResult Function(ChangeVibration value) changeVibration,
    required TResult Function(ChangeNotification value) changeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class $FetchSettingsCopyWith<$Res> {
  factory $FetchSettingsCopyWith(
          FetchSettings value, $Res Function(FetchSettings) then) =
      _$FetchSettingsCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchSettingsCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements $FetchSettingsCopyWith<$Res> {
  _$FetchSettingsCopyWithImpl(
      FetchSettings _value, $Res Function(FetchSettings) _then)
      : super(_value, (v) => _then(v as FetchSettings));

  @override
  FetchSettings get _value => super._value as FetchSettings;
}

/// @nodoc

class _$FetchSettings implements FetchSettings {
  _$FetchSettings();

  @override
  String toString() {
    return 'SettingsEvent.fetchSettings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchSettings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSettings,
    required TResult Function(bool darkThemeIsEnabled) changeTheme,
    required TResult Function(int wordCount) changeWordCount,
    required TResult Function(bool isVibration) changeVibration,
    required TResult Function(bool isNotification, String timeNotification)
        changeNotification,
  }) {
    return fetchSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
  }) {
    return fetchSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
    required TResult orElse(),
  }) {
    if (fetchSettings != null) {
      return fetchSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(ChangeWordCount value) changeWordCount,
    required TResult Function(ChangeVibration value) changeVibration,
    required TResult Function(ChangeNotification value) changeNotification,
  }) {
    return fetchSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
  }) {
    return fetchSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
    required TResult orElse(),
  }) {
    if (fetchSettings != null) {
      return fetchSettings(this);
    }
    return orElse();
  }
}

abstract class FetchSettings implements SettingsEvent {
  factory FetchSettings() = _$FetchSettings;
}

/// @nodoc
abstract class $ChangeThemeCopyWith<$Res> {
  factory $ChangeThemeCopyWith(
          ChangeTheme value, $Res Function(ChangeTheme) then) =
      _$ChangeThemeCopyWithImpl<$Res>;
  $Res call({bool darkThemeIsEnabled});
}

/// @nodoc
class _$ChangeThemeCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements $ChangeThemeCopyWith<$Res> {
  _$ChangeThemeCopyWithImpl(
      ChangeTheme _value, $Res Function(ChangeTheme) _then)
      : super(_value, (v) => _then(v as ChangeTheme));

  @override
  ChangeTheme get _value => super._value as ChangeTheme;

  @override
  $Res call({
    Object? darkThemeIsEnabled = freezed,
  }) {
    return _then(ChangeTheme(
      darkThemeIsEnabled == freezed
          ? _value.darkThemeIsEnabled
          : darkThemeIsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeTheme implements ChangeTheme {
  _$ChangeTheme(this.darkThemeIsEnabled);

  @override
  final bool darkThemeIsEnabled;

  @override
  String toString() {
    return 'SettingsEvent.changeTheme(darkThemeIsEnabled: $darkThemeIsEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeTheme &&
            const DeepCollectionEquality()
                .equals(other.darkThemeIsEnabled, darkThemeIsEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(darkThemeIsEnabled));

  @JsonKey(ignore: true)
  @override
  $ChangeThemeCopyWith<ChangeTheme> get copyWith =>
      _$ChangeThemeCopyWithImpl<ChangeTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSettings,
    required TResult Function(bool darkThemeIsEnabled) changeTheme,
    required TResult Function(int wordCount) changeWordCount,
    required TResult Function(bool isVibration) changeVibration,
    required TResult Function(bool isNotification, String timeNotification)
        changeNotification,
  }) {
    return changeTheme(darkThemeIsEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
  }) {
    return changeTheme?.call(darkThemeIsEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(darkThemeIsEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(ChangeWordCount value) changeWordCount,
    required TResult Function(ChangeVibration value) changeVibration,
    required TResult Function(ChangeNotification value) changeNotification,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class ChangeTheme implements SettingsEvent {
  factory ChangeTheme(bool darkThemeIsEnabled) = _$ChangeTheme;

  bool get darkThemeIsEnabled;
  @JsonKey(ignore: true)
  $ChangeThemeCopyWith<ChangeTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeWordCountCopyWith<$Res> {
  factory $ChangeWordCountCopyWith(
          ChangeWordCount value, $Res Function(ChangeWordCount) then) =
      _$ChangeWordCountCopyWithImpl<$Res>;
  $Res call({int wordCount});
}

/// @nodoc
class _$ChangeWordCountCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements $ChangeWordCountCopyWith<$Res> {
  _$ChangeWordCountCopyWithImpl(
      ChangeWordCount _value, $Res Function(ChangeWordCount) _then)
      : super(_value, (v) => _then(v as ChangeWordCount));

  @override
  ChangeWordCount get _value => super._value as ChangeWordCount;

  @override
  $Res call({
    Object? wordCount = freezed,
  }) {
    return _then(ChangeWordCount(
      wordCount == freezed
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeWordCount implements ChangeWordCount {
  _$ChangeWordCount(this.wordCount);

  @override
  final int wordCount;

  @override
  String toString() {
    return 'SettingsEvent.changeWordCount(wordCount: $wordCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeWordCount &&
            const DeepCollectionEquality().equals(other.wordCount, wordCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(wordCount));

  @JsonKey(ignore: true)
  @override
  $ChangeWordCountCopyWith<ChangeWordCount> get copyWith =>
      _$ChangeWordCountCopyWithImpl<ChangeWordCount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSettings,
    required TResult Function(bool darkThemeIsEnabled) changeTheme,
    required TResult Function(int wordCount) changeWordCount,
    required TResult Function(bool isVibration) changeVibration,
    required TResult Function(bool isNotification, String timeNotification)
        changeNotification,
  }) {
    return changeWordCount(wordCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
  }) {
    return changeWordCount?.call(wordCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
    required TResult orElse(),
  }) {
    if (changeWordCount != null) {
      return changeWordCount(wordCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(ChangeWordCount value) changeWordCount,
    required TResult Function(ChangeVibration value) changeVibration,
    required TResult Function(ChangeNotification value) changeNotification,
  }) {
    return changeWordCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
  }) {
    return changeWordCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
    required TResult orElse(),
  }) {
    if (changeWordCount != null) {
      return changeWordCount(this);
    }
    return orElse();
  }
}

abstract class ChangeWordCount implements SettingsEvent {
  factory ChangeWordCount(int wordCount) = _$ChangeWordCount;

  int get wordCount;
  @JsonKey(ignore: true)
  $ChangeWordCountCopyWith<ChangeWordCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeVibrationCopyWith<$Res> {
  factory $ChangeVibrationCopyWith(
          ChangeVibration value, $Res Function(ChangeVibration) then) =
      _$ChangeVibrationCopyWithImpl<$Res>;
  $Res call({bool isVibration});
}

/// @nodoc
class _$ChangeVibrationCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements $ChangeVibrationCopyWith<$Res> {
  _$ChangeVibrationCopyWithImpl(
      ChangeVibration _value, $Res Function(ChangeVibration) _then)
      : super(_value, (v) => _then(v as ChangeVibration));

  @override
  ChangeVibration get _value => super._value as ChangeVibration;

  @override
  $Res call({
    Object? isVibration = freezed,
  }) {
    return _then(ChangeVibration(
      isVibration == freezed
          ? _value.isVibration
          : isVibration // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeVibration implements ChangeVibration {
  _$ChangeVibration(this.isVibration);

  @override
  final bool isVibration;

  @override
  String toString() {
    return 'SettingsEvent.changeVibration(isVibration: $isVibration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeVibration &&
            const DeepCollectionEquality()
                .equals(other.isVibration, isVibration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isVibration));

  @JsonKey(ignore: true)
  @override
  $ChangeVibrationCopyWith<ChangeVibration> get copyWith =>
      _$ChangeVibrationCopyWithImpl<ChangeVibration>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSettings,
    required TResult Function(bool darkThemeIsEnabled) changeTheme,
    required TResult Function(int wordCount) changeWordCount,
    required TResult Function(bool isVibration) changeVibration,
    required TResult Function(bool isNotification, String timeNotification)
        changeNotification,
  }) {
    return changeVibration(isVibration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
  }) {
    return changeVibration?.call(isVibration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
    required TResult orElse(),
  }) {
    if (changeVibration != null) {
      return changeVibration(isVibration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(ChangeWordCount value) changeWordCount,
    required TResult Function(ChangeVibration value) changeVibration,
    required TResult Function(ChangeNotification value) changeNotification,
  }) {
    return changeVibration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
  }) {
    return changeVibration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
    required TResult orElse(),
  }) {
    if (changeVibration != null) {
      return changeVibration(this);
    }
    return orElse();
  }
}

abstract class ChangeVibration implements SettingsEvent {
  factory ChangeVibration(bool isVibration) = _$ChangeVibration;

  bool get isVibration;
  @JsonKey(ignore: true)
  $ChangeVibrationCopyWith<ChangeVibration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeNotificationCopyWith<$Res> {
  factory $ChangeNotificationCopyWith(
          ChangeNotification value, $Res Function(ChangeNotification) then) =
      _$ChangeNotificationCopyWithImpl<$Res>;
  $Res call({bool isNotification, String timeNotification});
}

/// @nodoc
class _$ChangeNotificationCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements $ChangeNotificationCopyWith<$Res> {
  _$ChangeNotificationCopyWithImpl(
      ChangeNotification _value, $Res Function(ChangeNotification) _then)
      : super(_value, (v) => _then(v as ChangeNotification));

  @override
  ChangeNotification get _value => super._value as ChangeNotification;

  @override
  $Res call({
    Object? isNotification = freezed,
    Object? timeNotification = freezed,
  }) {
    return _then(ChangeNotification(
      isNotification == freezed
          ? _value.isNotification
          : isNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      timeNotification == freezed
          ? _value.timeNotification
          : timeNotification // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeNotification implements ChangeNotification {
  _$ChangeNotification(this.isNotification, this.timeNotification);

  @override
  final bool isNotification;
  @override
  final String timeNotification;

  @override
  String toString() {
    return 'SettingsEvent.changeNotification(isNotification: $isNotification, timeNotification: $timeNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeNotification &&
            const DeepCollectionEquality()
                .equals(other.isNotification, isNotification) &&
            const DeepCollectionEquality()
                .equals(other.timeNotification, timeNotification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isNotification),
      const DeepCollectionEquality().hash(timeNotification));

  @JsonKey(ignore: true)
  @override
  $ChangeNotificationCopyWith<ChangeNotification> get copyWith =>
      _$ChangeNotificationCopyWithImpl<ChangeNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchSettings,
    required TResult Function(bool darkThemeIsEnabled) changeTheme,
    required TResult Function(int wordCount) changeWordCount,
    required TResult Function(bool isVibration) changeVibration,
    required TResult Function(bool isNotification, String timeNotification)
        changeNotification,
  }) {
    return changeNotification(isNotification, timeNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
  }) {
    return changeNotification?.call(isNotification, timeNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchSettings,
    TResult Function(bool darkThemeIsEnabled)? changeTheme,
    TResult Function(int wordCount)? changeWordCount,
    TResult Function(bool isVibration)? changeVibration,
    TResult Function(bool isNotification, String timeNotification)?
        changeNotification,
    required TResult orElse(),
  }) {
    if (changeNotification != null) {
      return changeNotification(isNotification, timeNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(ChangeWordCount value) changeWordCount,
    required TResult Function(ChangeVibration value) changeVibration,
    required TResult Function(ChangeNotification value) changeNotification,
  }) {
    return changeNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
  }) {
    return changeNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ChangeWordCount value)? changeWordCount,
    TResult Function(ChangeVibration value)? changeVibration,
    TResult Function(ChangeNotification value)? changeNotification,
    required TResult orElse(),
  }) {
    if (changeNotification != null) {
      return changeNotification(this);
    }
    return orElse();
  }
}

abstract class ChangeNotification implements SettingsEvent {
  factory ChangeNotification(bool isNotification, String timeNotification) =
      _$ChangeNotification;

  bool get isNotification;
  String get timeNotification;
  @JsonKey(ignore: true)
  $ChangeNotificationCopyWith<ChangeNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  _InitSettingsState initState() {
    return _InitSettingsState();
  }

  _SettingsLoaded loaded(Settings settings) {
    return _SettingsLoaded(
      settings,
    );
  }

  _SettingsError error(String message) {
    return _SettingsError(
      message,
    );
  }
}

/// @nodoc
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Settings settings) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitSettingsState value) initState,
    required TResult Function(_SettingsLoaded value) loaded,
    required TResult Function(_SettingsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;
}

/// @nodoc
abstract class _$InitSettingsStateCopyWith<$Res> {
  factory _$InitSettingsStateCopyWith(
          _InitSettingsState value, $Res Function(_InitSettingsState) then) =
      __$InitSettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$InitSettingsStateCopyWith<$Res> {
  __$InitSettingsStateCopyWithImpl(
      _InitSettingsState _value, $Res Function(_InitSettingsState) _then)
      : super(_value, (v) => _then(v as _InitSettingsState));

  @override
  _InitSettingsState get _value => super._value as _InitSettingsState;
}

/// @nodoc

class _$_InitSettingsState implements _InitSettingsState {
  _$_InitSettingsState();

  @override
  String toString() {
    return 'SettingsState.initState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitSettingsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Settings settings) loaded,
    required TResult Function(String message) error,
  }) {
    return initState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
  }) {
    return initState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitSettingsState value) initState,
    required TResult Function(_SettingsLoaded value) loaded,
    required TResult Function(_SettingsError value) error,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(this);
    }
    return orElse();
  }
}

abstract class _InitSettingsState implements SettingsState {
  factory _InitSettingsState() = _$_InitSettingsState;
}

/// @nodoc
abstract class _$SettingsLoadedCopyWith<$Res> {
  factory _$SettingsLoadedCopyWith(
          _SettingsLoaded value, $Res Function(_SettingsLoaded) then) =
      __$SettingsLoadedCopyWithImpl<$Res>;
  $Res call({Settings settings});
}

/// @nodoc
class __$SettingsLoadedCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsLoadedCopyWith<$Res> {
  __$SettingsLoadedCopyWithImpl(
      _SettingsLoaded _value, $Res Function(_SettingsLoaded) _then)
      : super(_value, (v) => _then(v as _SettingsLoaded));

  @override
  _SettingsLoaded get _value => super._value as _SettingsLoaded;

  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_SettingsLoaded(
      settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }
}

/// @nodoc

class _$_SettingsLoaded implements _SettingsLoaded {
  _$_SettingsLoaded(this.settings);

  @override
  final Settings settings;

  @override
  String toString() {
    return 'SettingsState.loaded(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsLoaded &&
            const DeepCollectionEquality().equals(other.settings, settings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(settings));

  @JsonKey(ignore: true)
  @override
  _$SettingsLoadedCopyWith<_SettingsLoaded> get copyWith =>
      __$SettingsLoadedCopyWithImpl<_SettingsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Settings settings) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitSettingsState value) initState,
    required TResult Function(_SettingsLoaded value) loaded,
    required TResult Function(_SettingsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _SettingsLoaded implements SettingsState {
  factory _SettingsLoaded(Settings settings) = _$_SettingsLoaded;

  Settings get settings;
  @JsonKey(ignore: true)
  _$SettingsLoadedCopyWith<_SettingsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SettingsErrorCopyWith<$Res> {
  factory _$SettingsErrorCopyWith(
          _SettingsError value, $Res Function(_SettingsError) then) =
      __$SettingsErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$SettingsErrorCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsErrorCopyWith<$Res> {
  __$SettingsErrorCopyWithImpl(
      _SettingsError _value, $Res Function(_SettingsError) _then)
      : super(_value, (v) => _then(v as _SettingsError));

  @override
  _SettingsError get _value => super._value as _SettingsError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SettingsError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingsError implements _SettingsError {
  _$_SettingsError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SettingsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SettingsErrorCopyWith<_SettingsError> get copyWith =>
      __$SettingsErrorCopyWithImpl<_SettingsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Settings settings) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Settings settings)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitSettingsState value) initState,
    required TResult Function(_SettingsLoaded value) loaded,
    required TResult Function(_SettingsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitSettingsState value)? initState,
    TResult Function(_SettingsLoaded value)? loaded,
    TResult Function(_SettingsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SettingsError implements SettingsState {
  factory _SettingsError(String message) = _$_SettingsError;

  String get message;
  @JsonKey(ignore: true)
  _$SettingsErrorCopyWith<_SettingsError> get copyWith =>
      throw _privateConstructorUsedError;
}
