// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'words_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WordsEventTearOff {
  const _$WordsEventTearOff();

  FetchAllWords fetchAllWords() {
    return FetchAllWords();
  }

  AddWord addWord(String word) {
    return AddWord(
      word,
    );
  }

  DeleteWord deleteWord(String word) {
    return DeleteWord(
      word,
    );
  }
}

/// @nodoc
const $WordsEvent = _$WordsEventTearOff();

/// @nodoc
mixin _$WordsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordsEventCopyWith<$Res> {
  factory $WordsEventCopyWith(
          WordsEvent value, $Res Function(WordsEvent) then) =
      _$WordsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WordsEventCopyWithImpl<$Res> implements $WordsEventCopyWith<$Res> {
  _$WordsEventCopyWithImpl(this._value, this._then);

  final WordsEvent _value;
  // ignore: unused_field
  final $Res Function(WordsEvent) _then;
}

/// @nodoc
abstract class $FetchAllWordsCopyWith<$Res> {
  factory $FetchAllWordsCopyWith(
          FetchAllWords value, $Res Function(FetchAllWords) then) =
      _$FetchAllWordsCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchAllWordsCopyWithImpl<$Res> extends _$WordsEventCopyWithImpl<$Res>
    implements $FetchAllWordsCopyWith<$Res> {
  _$FetchAllWordsCopyWithImpl(
      FetchAllWords _value, $Res Function(FetchAllWords) _then)
      : super(_value, (v) => _then(v as FetchAllWords));

  @override
  FetchAllWords get _value => super._value as FetchAllWords;
}

/// @nodoc

class _$FetchAllWords implements FetchAllWords {
  _$FetchAllWords();

  @override
  String toString() {
    return 'WordsEvent.fetchAllWords()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchAllWords);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return fetchAllWords();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return fetchAllWords?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
    required TResult orElse(),
  }) {
    if (fetchAllWords != null) {
      return fetchAllWords();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return fetchAllWords(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return fetchAllWords?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
    required TResult orElse(),
  }) {
    if (fetchAllWords != null) {
      return fetchAllWords(this);
    }
    return orElse();
  }
}

abstract class FetchAllWords implements WordsEvent {
  factory FetchAllWords() = _$FetchAllWords;
}

/// @nodoc
abstract class $AddWordCopyWith<$Res> {
  factory $AddWordCopyWith(AddWord value, $Res Function(AddWord) then) =
      _$AddWordCopyWithImpl<$Res>;
  $Res call({String word});
}

/// @nodoc
class _$AddWordCopyWithImpl<$Res> extends _$WordsEventCopyWithImpl<$Res>
    implements $AddWordCopyWith<$Res> {
  _$AddWordCopyWithImpl(AddWord _value, $Res Function(AddWord) _then)
      : super(_value, (v) => _then(v as AddWord));

  @override
  AddWord get _value => super._value as AddWord;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(AddWord(
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddWord implements AddWord {
  _$AddWord(this.word);

  @override
  final String word;

  @override
  String toString() {
    return 'WordsEvent.addWord(word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddWord &&
            const DeepCollectionEquality().equals(other.word, word));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(word));

  @JsonKey(ignore: true)
  @override
  $AddWordCopyWith<AddWord> get copyWith =>
      _$AddWordCopyWithImpl<AddWord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return addWord(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return addWord?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
    required TResult orElse(),
  }) {
    if (addWord != null) {
      return addWord(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return addWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return addWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
    required TResult orElse(),
  }) {
    if (addWord != null) {
      return addWord(this);
    }
    return orElse();
  }
}

abstract class AddWord implements WordsEvent {
  factory AddWord(String word) = _$AddWord;

  String get word;
  @JsonKey(ignore: true)
  $AddWordCopyWith<AddWord> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteWordCopyWith<$Res> {
  factory $DeleteWordCopyWith(
          DeleteWord value, $Res Function(DeleteWord) then) =
      _$DeleteWordCopyWithImpl<$Res>;
  $Res call({String word});
}

/// @nodoc
class _$DeleteWordCopyWithImpl<$Res> extends _$WordsEventCopyWithImpl<$Res>
    implements $DeleteWordCopyWith<$Res> {
  _$DeleteWordCopyWithImpl(DeleteWord _value, $Res Function(DeleteWord) _then)
      : super(_value, (v) => _then(v as DeleteWord));

  @override
  DeleteWord get _value => super._value as DeleteWord;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(DeleteWord(
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteWord implements DeleteWord {
  _$DeleteWord(this.word);

  @override
  final String word;

  @override
  String toString() {
    return 'WordsEvent.deleteWord(word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteWord &&
            const DeepCollectionEquality().equals(other.word, word));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(word));

  @JsonKey(ignore: true)
  @override
  $DeleteWordCopyWith<DeleteWord> get copyWith =>
      _$DeleteWordCopyWithImpl<DeleteWord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return deleteWord(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return deleteWord?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
    required TResult orElse(),
  }) {
    if (deleteWord != null) {
      return deleteWord(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return deleteWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return deleteWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
    required TResult orElse(),
  }) {
    if (deleteWord != null) {
      return deleteWord(this);
    }
    return orElse();
  }
}

abstract class DeleteWord implements WordsEvent {
  factory DeleteWord(String word) = _$DeleteWord;

  String get word;
  @JsonKey(ignore: true)
  $DeleteWordCopyWith<DeleteWord> get copyWith =>
      throw _privateConstructorUsedError;
}
