// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WordDetailsEventTearOff {
  const _$WordDetailsEventTearOff();

  FetchWord fetchWord(String title) {
    return FetchWord(
      title,
    );
  }

  ChangeImage changeImage(int imageIndex) {
    return ChangeImage(
      imageIndex,
    );
  }
}

/// @nodoc
const $WordDetailsEvent = _$WordDetailsEventTearOff();

/// @nodoc
mixin _$WordDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) fetchWord,
    required TResult Function(int imageIndex) changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? fetchWord,
    TResult Function(int imageIndex)? changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? fetchWord,
    TResult Function(int imageIndex)? changeImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchWord value) fetchWord,
    required TResult Function(ChangeImage value) changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchWord value)? fetchWord,
    TResult Function(ChangeImage value)? changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchWord value)? fetchWord,
    TResult Function(ChangeImage value)? changeImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDetailsEventCopyWith<$Res> {
  factory $WordDetailsEventCopyWith(
          WordDetailsEvent value, $Res Function(WordDetailsEvent) then) =
      _$WordDetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WordDetailsEventCopyWithImpl<$Res>
    implements $WordDetailsEventCopyWith<$Res> {
  _$WordDetailsEventCopyWithImpl(this._value, this._then);

  final WordDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(WordDetailsEvent) _then;
}

/// @nodoc
abstract class $FetchWordCopyWith<$Res> {
  factory $FetchWordCopyWith(FetchWord value, $Res Function(FetchWord) then) =
      _$FetchWordCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$FetchWordCopyWithImpl<$Res> extends _$WordDetailsEventCopyWithImpl<$Res>
    implements $FetchWordCopyWith<$Res> {
  _$FetchWordCopyWithImpl(FetchWord _value, $Res Function(FetchWord) _then)
      : super(_value, (v) => _then(v as FetchWord));

  @override
  FetchWord get _value => super._value as FetchWord;

  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(FetchWord(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchWord implements FetchWord {
  _$FetchWord(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'WordDetailsEvent.fetchWord(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchWord &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $FetchWordCopyWith<FetchWord> get copyWith =>
      _$FetchWordCopyWithImpl<FetchWord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) fetchWord,
    required TResult Function(int imageIndex) changeImage,
  }) {
    return fetchWord(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? fetchWord,
    TResult Function(int imageIndex)? changeImage,
  }) {
    return fetchWord?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? fetchWord,
    TResult Function(int imageIndex)? changeImage,
    required TResult orElse(),
  }) {
    if (fetchWord != null) {
      return fetchWord(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchWord value) fetchWord,
    required TResult Function(ChangeImage value) changeImage,
  }) {
    return fetchWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchWord value)? fetchWord,
    TResult Function(ChangeImage value)? changeImage,
  }) {
    return fetchWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchWord value)? fetchWord,
    TResult Function(ChangeImage value)? changeImage,
    required TResult orElse(),
  }) {
    if (fetchWord != null) {
      return fetchWord(this);
    }
    return orElse();
  }
}

abstract class FetchWord implements WordDetailsEvent {
  factory FetchWord(String title) = _$FetchWord;

  String get title;
  @JsonKey(ignore: true)
  $FetchWordCopyWith<FetchWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeImageCopyWith<$Res> {
  factory $ChangeImageCopyWith(
          ChangeImage value, $Res Function(ChangeImage) then) =
      _$ChangeImageCopyWithImpl<$Res>;
  $Res call({int imageIndex});
}

/// @nodoc
class _$ChangeImageCopyWithImpl<$Res>
    extends _$WordDetailsEventCopyWithImpl<$Res>
    implements $ChangeImageCopyWith<$Res> {
  _$ChangeImageCopyWithImpl(
      ChangeImage _value, $Res Function(ChangeImage) _then)
      : super(_value, (v) => _then(v as ChangeImage));

  @override
  ChangeImage get _value => super._value as ChangeImage;

  @override
  $Res call({
    Object? imageIndex = freezed,
  }) {
    return _then(ChangeImage(
      imageIndex == freezed
          ? _value.imageIndex
          : imageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeImage implements ChangeImage {
  _$ChangeImage(this.imageIndex);

  @override
  final int imageIndex;

  @override
  String toString() {
    return 'WordDetailsEvent.changeImage(imageIndex: $imageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeImage &&
            const DeepCollectionEquality()
                .equals(other.imageIndex, imageIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imageIndex));

  @JsonKey(ignore: true)
  @override
  $ChangeImageCopyWith<ChangeImage> get copyWith =>
      _$ChangeImageCopyWithImpl<ChangeImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) fetchWord,
    required TResult Function(int imageIndex) changeImage,
  }) {
    return changeImage(imageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? fetchWord,
    TResult Function(int imageIndex)? changeImage,
  }) {
    return changeImage?.call(imageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? fetchWord,
    TResult Function(int imageIndex)? changeImage,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(imageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchWord value) fetchWord,
    required TResult Function(ChangeImage value) changeImage,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchWord value)? fetchWord,
    TResult Function(ChangeImage value)? changeImage,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchWord value)? fetchWord,
    TResult Function(ChangeImage value)? changeImage,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class ChangeImage implements WordDetailsEvent {
  factory ChangeImage(int imageIndex) = _$ChangeImage;

  int get imageIndex;
  @JsonKey(ignore: true)
  $ChangeImageCopyWith<ChangeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$WordDetailsStateTearOff {
  const _$WordDetailsStateTearOff();

  _InitWordDetailsState initState() {
    return _InitWordDetailsState();
  }

  _WordLoaded loaded(Word word, dynamic imageIndex) {
    return _WordLoaded(
      word,
      imageIndex,
    );
  }

  _WordLoading loading() {
    return _WordLoading();
  }

  _WordsError error(String message) {
    return _WordsError(
      message,
    );
  }
}

/// @nodoc
const $WordDetailsState = _$WordDetailsStateTearOff();

/// @nodoc
mixin _$WordDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Word word, dynamic imageIndex) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordDetailsState value) initState,
    required TResult Function(_WordLoaded value) loaded,
    required TResult Function(_WordLoading value) loading,
    required TResult Function(_WordsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDetailsStateCopyWith<$Res> {
  factory $WordDetailsStateCopyWith(
          WordDetailsState value, $Res Function(WordDetailsState) then) =
      _$WordDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WordDetailsStateCopyWithImpl<$Res>
    implements $WordDetailsStateCopyWith<$Res> {
  _$WordDetailsStateCopyWithImpl(this._value, this._then);

  final WordDetailsState _value;
  // ignore: unused_field
  final $Res Function(WordDetailsState) _then;
}

/// @nodoc
abstract class _$InitWordDetailsStateCopyWith<$Res> {
  factory _$InitWordDetailsStateCopyWith(_InitWordDetailsState value,
          $Res Function(_InitWordDetailsState) then) =
      __$InitWordDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitWordDetailsStateCopyWithImpl<$Res>
    extends _$WordDetailsStateCopyWithImpl<$Res>
    implements _$InitWordDetailsStateCopyWith<$Res> {
  __$InitWordDetailsStateCopyWithImpl(
      _InitWordDetailsState _value, $Res Function(_InitWordDetailsState) _then)
      : super(_value, (v) => _then(v as _InitWordDetailsState));

  @override
  _InitWordDetailsState get _value => super._value as _InitWordDetailsState;
}

/// @nodoc

class _$_InitWordDetailsState implements _InitWordDetailsState {
  _$_InitWordDetailsState();

  @override
  String toString() {
    return 'WordDetailsState.initState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitWordDetailsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Word word, dynamic imageIndex) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return initState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) {
    return initState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
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
    required TResult Function(_InitWordDetailsState value) initState,
    required TResult Function(_WordLoaded value) loaded,
    required TResult Function(_WordLoading value) loading,
    required TResult Function(_WordsError value) error,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(this);
    }
    return orElse();
  }
}

abstract class _InitWordDetailsState implements WordDetailsState {
  factory _InitWordDetailsState() = _$_InitWordDetailsState;
}

/// @nodoc
abstract class _$WordLoadedCopyWith<$Res> {
  factory _$WordLoadedCopyWith(
          _WordLoaded value, $Res Function(_WordLoaded) then) =
      __$WordLoadedCopyWithImpl<$Res>;
  $Res call({Word word, dynamic imageIndex});
}

/// @nodoc
class __$WordLoadedCopyWithImpl<$Res>
    extends _$WordDetailsStateCopyWithImpl<$Res>
    implements _$WordLoadedCopyWith<$Res> {
  __$WordLoadedCopyWithImpl(
      _WordLoaded _value, $Res Function(_WordLoaded) _then)
      : super(_value, (v) => _then(v as _WordLoaded));

  @override
  _WordLoaded get _value => super._value as _WordLoaded;

  @override
  $Res call({
    Object? word = freezed,
    Object? imageIndex = freezed,
  }) {
    return _then(_WordLoaded(
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
      imageIndex == freezed ? _value.imageIndex : imageIndex,
    ));
  }
}

/// @nodoc

class _$_WordLoaded implements _WordLoaded {
  _$_WordLoaded(this.word, this.imageIndex);

  @override
  final Word word;
  @override
  final dynamic imageIndex;

  @override
  String toString() {
    return 'WordDetailsState.loaded(word: $word, imageIndex: $imageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordLoaded &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality()
                .equals(other.imageIndex, imageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(imageIndex));

  @JsonKey(ignore: true)
  @override
  _$WordLoadedCopyWith<_WordLoaded> get copyWith =>
      __$WordLoadedCopyWithImpl<_WordLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Word word, dynamic imageIndex) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loaded(word, imageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(word, imageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(word, imageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordDetailsState value) initState,
    required TResult Function(_WordLoaded value) loaded,
    required TResult Function(_WordLoading value) loading,
    required TResult Function(_WordsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _WordLoaded implements WordDetailsState {
  factory _WordLoaded(Word word, dynamic imageIndex) = _$_WordLoaded;

  Word get word;
  dynamic get imageIndex;
  @JsonKey(ignore: true)
  _$WordLoadedCopyWith<_WordLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WordLoadingCopyWith<$Res> {
  factory _$WordLoadingCopyWith(
          _WordLoading value, $Res Function(_WordLoading) then) =
      __$WordLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$WordLoadingCopyWithImpl<$Res>
    extends _$WordDetailsStateCopyWithImpl<$Res>
    implements _$WordLoadingCopyWith<$Res> {
  __$WordLoadingCopyWithImpl(
      _WordLoading _value, $Res Function(_WordLoading) _then)
      : super(_value, (v) => _then(v as _WordLoading));

  @override
  _WordLoading get _value => super._value as _WordLoading;
}

/// @nodoc

class _$_WordLoading implements _WordLoading {
  _$_WordLoading();

  @override
  String toString() {
    return 'WordDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WordLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Word word, dynamic imageIndex) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordDetailsState value) initState,
    required TResult Function(_WordLoaded value) loaded,
    required TResult Function(_WordLoading value) loading,
    required TResult Function(_WordsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _WordLoading implements WordDetailsState {
  factory _WordLoading() = _$_WordLoading;
}

/// @nodoc
abstract class _$WordsErrorCopyWith<$Res> {
  factory _$WordsErrorCopyWith(
          _WordsError value, $Res Function(_WordsError) then) =
      __$WordsErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$WordsErrorCopyWithImpl<$Res>
    extends _$WordDetailsStateCopyWithImpl<$Res>
    implements _$WordsErrorCopyWith<$Res> {
  __$WordsErrorCopyWithImpl(
      _WordsError _value, $Res Function(_WordsError) _then)
      : super(_value, (v) => _then(v as _WordsError));

  @override
  _WordsError get _value => super._value as _WordsError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_WordsError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WordsError implements _WordsError {
  _$_WordsError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WordDetailsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordsError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$WordsErrorCopyWith<_WordsError> get copyWith =>
      __$WordsErrorCopyWithImpl<_WordsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(Word word, dynamic imageIndex) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(Word word, dynamic imageIndex)? loaded,
    TResult Function()? loading,
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
    required TResult Function(_InitWordDetailsState value) initState,
    required TResult Function(_WordLoaded value) loaded,
    required TResult Function(_WordLoading value) loading,
    required TResult Function(_WordsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordDetailsState value)? initState,
    TResult Function(_WordLoaded value)? loaded,
    TResult Function(_WordLoading value)? loading,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _WordsError implements WordDetailsState {
  factory _WordsError(String message) = _$_WordsError;

  String get message;
  @JsonKey(ignore: true)
  _$WordsErrorCopyWith<_WordsError> get copyWith =>
      throw _privateConstructorUsedError;
}
