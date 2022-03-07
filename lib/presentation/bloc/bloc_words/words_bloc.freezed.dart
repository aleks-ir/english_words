// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'words_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WordsEventTearOff {
  const _$WordsEventTearOff();

  GetWordResponseFromApi getWordResponseFromApi(String word) {
    return GetWordResponseFromApi(
      word,
    );
  }

  GetImageResponseFromApi getImageResponseFromApi(String word) {
    return GetImageResponseFromApi(
      word,
    );
  }

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
    required TResult Function(String word) getWordResponseFromApi,
    required TResult Function(String word) getImageResponseFromApi,
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWordResponseFromApi value)
        getWordResponseFromApi,
    required TResult Function(GetImageResponseFromApi value)
        getImageResponseFromApi,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
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
abstract class $GetWordResponseFromApiCopyWith<$Res> {
  factory $GetWordResponseFromApiCopyWith(GetWordResponseFromApi value,
          $Res Function(GetWordResponseFromApi) then) =
      _$GetWordResponseFromApiCopyWithImpl<$Res>;
  $Res call({String word});
}

/// @nodoc
class _$GetWordResponseFromApiCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res>
    implements $GetWordResponseFromApiCopyWith<$Res> {
  _$GetWordResponseFromApiCopyWithImpl(GetWordResponseFromApi _value,
      $Res Function(GetWordResponseFromApi) _then)
      : super(_value, (v) => _then(v as GetWordResponseFromApi));

  @override
  GetWordResponseFromApi get _value => super._value as GetWordResponseFromApi;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(GetWordResponseFromApi(
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetWordResponseFromApi implements GetWordResponseFromApi {
  _$GetWordResponseFromApi(this.word);

  @override
  final String word;

  @override
  String toString() {
    return 'WordsEvent.getWordResponseFromApi(word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetWordResponseFromApi &&
            const DeepCollectionEquality().equals(other.word, word));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(word));

  @JsonKey(ignore: true)
  @override
  $GetWordResponseFromApiCopyWith<GetWordResponseFromApi> get copyWith =>
      _$GetWordResponseFromApiCopyWithImpl<GetWordResponseFromApi>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) getWordResponseFromApi,
    required TResult Function(String word) getImageResponseFromApi,
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return getWordResponseFromApi(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return getWordResponseFromApi?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
    required TResult orElse(),
  }) {
    if (getWordResponseFromApi != null) {
      return getWordResponseFromApi(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWordResponseFromApi value)
        getWordResponseFromApi,
    required TResult Function(GetImageResponseFromApi value)
        getImageResponseFromApi,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return getWordResponseFromApi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return getWordResponseFromApi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
    required TResult orElse(),
  }) {
    if (getWordResponseFromApi != null) {
      return getWordResponseFromApi(this);
    }
    return orElse();
  }
}

abstract class GetWordResponseFromApi implements WordsEvent {
  factory GetWordResponseFromApi(String word) = _$GetWordResponseFromApi;

  String get word;
  @JsonKey(ignore: true)
  $GetWordResponseFromApiCopyWith<GetWordResponseFromApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetImageResponseFromApiCopyWith<$Res> {
  factory $GetImageResponseFromApiCopyWith(GetImageResponseFromApi value,
          $Res Function(GetImageResponseFromApi) then) =
      _$GetImageResponseFromApiCopyWithImpl<$Res>;
  $Res call({String word});
}

/// @nodoc
class _$GetImageResponseFromApiCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res>
    implements $GetImageResponseFromApiCopyWith<$Res> {
  _$GetImageResponseFromApiCopyWithImpl(GetImageResponseFromApi _value,
      $Res Function(GetImageResponseFromApi) _then)
      : super(_value, (v) => _then(v as GetImageResponseFromApi));

  @override
  GetImageResponseFromApi get _value => super._value as GetImageResponseFromApi;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(GetImageResponseFromApi(
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetImageResponseFromApi implements GetImageResponseFromApi {
  _$GetImageResponseFromApi(this.word);

  @override
  final String word;

  @override
  String toString() {
    return 'WordsEvent.getImageResponseFromApi(word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetImageResponseFromApi &&
            const DeepCollectionEquality().equals(other.word, word));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(word));

  @JsonKey(ignore: true)
  @override
  $GetImageResponseFromApiCopyWith<GetImageResponseFromApi> get copyWith =>
      _$GetImageResponseFromApiCopyWithImpl<GetImageResponseFromApi>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) getWordResponseFromApi,
    required TResult Function(String word) getImageResponseFromApi,
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return getImageResponseFromApi(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return getImageResponseFromApi?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
    required TResult orElse(),
  }) {
    if (getImageResponseFromApi != null) {
      return getImageResponseFromApi(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWordResponseFromApi value)
        getWordResponseFromApi,
    required TResult Function(GetImageResponseFromApi value)
        getImageResponseFromApi,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return getImageResponseFromApi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return getImageResponseFromApi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
    required TResult orElse(),
  }) {
    if (getImageResponseFromApi != null) {
      return getImageResponseFromApi(this);
    }
    return orElse();
  }
}

abstract class GetImageResponseFromApi implements WordsEvent {
  factory GetImageResponseFromApi(String word) = _$GetImageResponseFromApi;

  String get word;
  @JsonKey(ignore: true)
  $GetImageResponseFromApiCopyWith<GetImageResponseFromApi> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(String word) getWordResponseFromApi,
    required TResult Function(String word) getImageResponseFromApi,
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return fetchAllWords();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return fetchAllWords?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
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
    required TResult Function(GetWordResponseFromApi value)
        getWordResponseFromApi,
    required TResult Function(GetImageResponseFromApi value)
        getImageResponseFromApi,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return fetchAllWords(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return fetchAllWords?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
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
    required TResult Function(String word) getWordResponseFromApi,
    required TResult Function(String word) getImageResponseFromApi,
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return addWord(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return addWord?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
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
    required TResult Function(GetWordResponseFromApi value)
        getWordResponseFromApi,
    required TResult Function(GetImageResponseFromApi value)
        getImageResponseFromApi,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return addWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return addWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
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
    required TResult Function(String word) getWordResponseFromApi,
    required TResult Function(String word) getImageResponseFromApi,
    required TResult Function() fetchAllWords,
    required TResult Function(String word) addWord,
    required TResult Function(String word) deleteWord,
  }) {
    return deleteWord(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
    TResult Function()? fetchAllWords,
    TResult Function(String word)? addWord,
    TResult Function(String word)? deleteWord,
  }) {
    return deleteWord?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? getWordResponseFromApi,
    TResult Function(String word)? getImageResponseFromApi,
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
    required TResult Function(GetWordResponseFromApi value)
        getWordResponseFromApi,
    required TResult Function(GetImageResponseFromApi value)
        getImageResponseFromApi,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWord value) deleteWord,
  }) {
    return deleteWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWord value)? deleteWord,
  }) {
    return deleteWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWordResponseFromApi value)? getWordResponseFromApi,
    TResult Function(GetImageResponseFromApi value)? getImageResponseFromApi,
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

/// @nodoc
class _$WordsStateTearOff {
  const _$WordsStateTearOff();

  _InitWordsState initState() {
    return _InitWordsState();
  }

  _WordsLoading loading() {
    return _WordsLoading();
  }

  _ContentFromWordApi contentFromWordApi(WordResponseDto wordResponseDto) {
    return _ContentFromWordApi(
      wordResponseDto,
    );
  }

  _ContentFromImageApi contentFromImageApi(ImageResponseDto imageResponseDto) {
    return _ContentFromImageApi(
      imageResponseDto,
    );
  }

  _WordsContent content(List<Word> listOfWords) {
    return _WordsContent(
      listOfWords,
    );
  }

  _WordsError error(dynamic message) {
    return _WordsError(
      message,
    );
  }
}

/// @nodoc
const $WordsState = _$WordsStateTearOff();

/// @nodoc
mixin _$WordsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loading,
    required TResult Function(WordResponseDto wordResponseDto)
        contentFromWordApi,
    required TResult Function(ImageResponseDto imageResponseDto)
        contentFromImageApi,
    required TResult Function(List<Word> listOfWords) content,
    required TResult Function(dynamic message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoading value) loading,
    required TResult Function(_ContentFromWordApi value) contentFromWordApi,
    required TResult Function(_ContentFromImageApi value) contentFromImageApi,
    required TResult Function(_WordsContent value) content,
    required TResult Function(_WordsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordsStateCopyWith<$Res> {
  factory $WordsStateCopyWith(
          WordsState value, $Res Function(WordsState) then) =
      _$WordsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WordsStateCopyWithImpl<$Res> implements $WordsStateCopyWith<$Res> {
  _$WordsStateCopyWithImpl(this._value, this._then);

  final WordsState _value;
  // ignore: unused_field
  final $Res Function(WordsState) _then;
}

/// @nodoc
abstract class _$InitWordsStateCopyWith<$Res> {
  factory _$InitWordsStateCopyWith(
          _InitWordsState value, $Res Function(_InitWordsState) then) =
      __$InitWordsStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitWordsStateCopyWithImpl<$Res> extends _$WordsStateCopyWithImpl<$Res>
    implements _$InitWordsStateCopyWith<$Res> {
  __$InitWordsStateCopyWithImpl(
      _InitWordsState _value, $Res Function(_InitWordsState) _then)
      : super(_value, (v) => _then(v as _InitWordsState));

  @override
  _InitWordsState get _value => super._value as _InitWordsState;
}

/// @nodoc

class _$_InitWordsState implements _InitWordsState {
  _$_InitWordsState();

  @override
  String toString() {
    return 'WordsState.initState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitWordsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loading,
    required TResult Function(WordResponseDto wordResponseDto)
        contentFromWordApi,
    required TResult Function(ImageResponseDto imageResponseDto)
        contentFromImageApi,
    required TResult Function(List<Word> listOfWords) content,
    required TResult Function(dynamic message) error,
  }) {
    return initState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
  }) {
    return initState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
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
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoading value) loading,
    required TResult Function(_ContentFromWordApi value) contentFromWordApi,
    required TResult Function(_ContentFromImageApi value) contentFromImageApi,
    required TResult Function(_WordsContent value) content,
    required TResult Function(_WordsError value) error,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(this);
    }
    return orElse();
  }
}

abstract class _InitWordsState implements WordsState {
  factory _InitWordsState() = _$_InitWordsState;
}

/// @nodoc
abstract class _$WordsLoadingCopyWith<$Res> {
  factory _$WordsLoadingCopyWith(
          _WordsLoading value, $Res Function(_WordsLoading) then) =
      __$WordsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$WordsLoadingCopyWithImpl<$Res> extends _$WordsStateCopyWithImpl<$Res>
    implements _$WordsLoadingCopyWith<$Res> {
  __$WordsLoadingCopyWithImpl(
      _WordsLoading _value, $Res Function(_WordsLoading) _then)
      : super(_value, (v) => _then(v as _WordsLoading));

  @override
  _WordsLoading get _value => super._value as _WordsLoading;
}

/// @nodoc

class _$_WordsLoading implements _WordsLoading {
  _$_WordsLoading();

  @override
  String toString() {
    return 'WordsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WordsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loading,
    required TResult Function(WordResponseDto wordResponseDto)
        contentFromWordApi,
    required TResult Function(ImageResponseDto imageResponseDto)
        contentFromImageApi,
    required TResult Function(List<Word> listOfWords) content,
    required TResult Function(dynamic message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
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
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoading value) loading,
    required TResult Function(_ContentFromWordApi value) contentFromWordApi,
    required TResult Function(_ContentFromImageApi value) contentFromImageApi,
    required TResult Function(_WordsContent value) content,
    required TResult Function(_WordsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _WordsLoading implements WordsState {
  factory _WordsLoading() = _$_WordsLoading;
}

/// @nodoc
abstract class _$ContentFromWordApiCopyWith<$Res> {
  factory _$ContentFromWordApiCopyWith(
          _ContentFromWordApi value, $Res Function(_ContentFromWordApi) then) =
      __$ContentFromWordApiCopyWithImpl<$Res>;
  $Res call({WordResponseDto wordResponseDto});
}

/// @nodoc
class __$ContentFromWordApiCopyWithImpl<$Res>
    extends _$WordsStateCopyWithImpl<$Res>
    implements _$ContentFromWordApiCopyWith<$Res> {
  __$ContentFromWordApiCopyWithImpl(
      _ContentFromWordApi _value, $Res Function(_ContentFromWordApi) _then)
      : super(_value, (v) => _then(v as _ContentFromWordApi));

  @override
  _ContentFromWordApi get _value => super._value as _ContentFromWordApi;

  @override
  $Res call({
    Object? wordResponseDto = freezed,
  }) {
    return _then(_ContentFromWordApi(
      wordResponseDto == freezed
          ? _value.wordResponseDto
          : wordResponseDto // ignore: cast_nullable_to_non_nullable
              as WordResponseDto,
    ));
  }
}

/// @nodoc

class _$_ContentFromWordApi implements _ContentFromWordApi {
  _$_ContentFromWordApi(this.wordResponseDto);

  @override
  final WordResponseDto wordResponseDto;

  @override
  String toString() {
    return 'WordsState.contentFromWordApi(wordResponseDto: $wordResponseDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentFromWordApi &&
            const DeepCollectionEquality()
                .equals(other.wordResponseDto, wordResponseDto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(wordResponseDto));

  @JsonKey(ignore: true)
  @override
  _$ContentFromWordApiCopyWith<_ContentFromWordApi> get copyWith =>
      __$ContentFromWordApiCopyWithImpl<_ContentFromWordApi>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loading,
    required TResult Function(WordResponseDto wordResponseDto)
        contentFromWordApi,
    required TResult Function(ImageResponseDto imageResponseDto)
        contentFromImageApi,
    required TResult Function(List<Word> listOfWords) content,
    required TResult Function(dynamic message) error,
  }) {
    return contentFromWordApi(wordResponseDto);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
  }) {
    return contentFromWordApi?.call(wordResponseDto);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (contentFromWordApi != null) {
      return contentFromWordApi(wordResponseDto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoading value) loading,
    required TResult Function(_ContentFromWordApi value) contentFromWordApi,
    required TResult Function(_ContentFromImageApi value) contentFromImageApi,
    required TResult Function(_WordsContent value) content,
    required TResult Function(_WordsError value) error,
  }) {
    return contentFromWordApi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
  }) {
    return contentFromWordApi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (contentFromWordApi != null) {
      return contentFromWordApi(this);
    }
    return orElse();
  }
}

abstract class _ContentFromWordApi implements WordsState {
  factory _ContentFromWordApi(WordResponseDto wordResponseDto) =
      _$_ContentFromWordApi;

  WordResponseDto get wordResponseDto;
  @JsonKey(ignore: true)
  _$ContentFromWordApiCopyWith<_ContentFromWordApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ContentFromImageApiCopyWith<$Res> {
  factory _$ContentFromImageApiCopyWith(_ContentFromImageApi value,
          $Res Function(_ContentFromImageApi) then) =
      __$ContentFromImageApiCopyWithImpl<$Res>;
  $Res call({ImageResponseDto imageResponseDto});
}

/// @nodoc
class __$ContentFromImageApiCopyWithImpl<$Res>
    extends _$WordsStateCopyWithImpl<$Res>
    implements _$ContentFromImageApiCopyWith<$Res> {
  __$ContentFromImageApiCopyWithImpl(
      _ContentFromImageApi _value, $Res Function(_ContentFromImageApi) _then)
      : super(_value, (v) => _then(v as _ContentFromImageApi));

  @override
  _ContentFromImageApi get _value => super._value as _ContentFromImageApi;

  @override
  $Res call({
    Object? imageResponseDto = freezed,
  }) {
    return _then(_ContentFromImageApi(
      imageResponseDto == freezed
          ? _value.imageResponseDto
          : imageResponseDto // ignore: cast_nullable_to_non_nullable
              as ImageResponseDto,
    ));
  }
}

/// @nodoc

class _$_ContentFromImageApi implements _ContentFromImageApi {
  _$_ContentFromImageApi(this.imageResponseDto);

  @override
  final ImageResponseDto imageResponseDto;

  @override
  String toString() {
    return 'WordsState.contentFromImageApi(imageResponseDto: $imageResponseDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentFromImageApi &&
            const DeepCollectionEquality()
                .equals(other.imageResponseDto, imageResponseDto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(imageResponseDto));

  @JsonKey(ignore: true)
  @override
  _$ContentFromImageApiCopyWith<_ContentFromImageApi> get copyWith =>
      __$ContentFromImageApiCopyWithImpl<_ContentFromImageApi>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loading,
    required TResult Function(WordResponseDto wordResponseDto)
        contentFromWordApi,
    required TResult Function(ImageResponseDto imageResponseDto)
        contentFromImageApi,
    required TResult Function(List<Word> listOfWords) content,
    required TResult Function(dynamic message) error,
  }) {
    return contentFromImageApi(imageResponseDto);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
  }) {
    return contentFromImageApi?.call(imageResponseDto);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (contentFromImageApi != null) {
      return contentFromImageApi(imageResponseDto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoading value) loading,
    required TResult Function(_ContentFromWordApi value) contentFromWordApi,
    required TResult Function(_ContentFromImageApi value) contentFromImageApi,
    required TResult Function(_WordsContent value) content,
    required TResult Function(_WordsError value) error,
  }) {
    return contentFromImageApi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
  }) {
    return contentFromImageApi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (contentFromImageApi != null) {
      return contentFromImageApi(this);
    }
    return orElse();
  }
}

abstract class _ContentFromImageApi implements WordsState {
  factory _ContentFromImageApi(ImageResponseDto imageResponseDto) =
      _$_ContentFromImageApi;

  ImageResponseDto get imageResponseDto;
  @JsonKey(ignore: true)
  _$ContentFromImageApiCopyWith<_ContentFromImageApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WordsContentCopyWith<$Res> {
  factory _$WordsContentCopyWith(
          _WordsContent value, $Res Function(_WordsContent) then) =
      __$WordsContentCopyWithImpl<$Res>;
  $Res call({List<Word> listOfWords});
}

/// @nodoc
class __$WordsContentCopyWithImpl<$Res> extends _$WordsStateCopyWithImpl<$Res>
    implements _$WordsContentCopyWith<$Res> {
  __$WordsContentCopyWithImpl(
      _WordsContent _value, $Res Function(_WordsContent) _then)
      : super(_value, (v) => _then(v as _WordsContent));

  @override
  _WordsContent get _value => super._value as _WordsContent;

  @override
  $Res call({
    Object? listOfWords = freezed,
  }) {
    return _then(_WordsContent(
      listOfWords == freezed
          ? _value.listOfWords
          : listOfWords // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc

class _$_WordsContent implements _WordsContent {
  _$_WordsContent(this.listOfWords);

  @override
  final List<Word> listOfWords;

  @override
  String toString() {
    return 'WordsState.content(listOfWords: $listOfWords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordsContent &&
            const DeepCollectionEquality()
                .equals(other.listOfWords, listOfWords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(listOfWords));

  @JsonKey(ignore: true)
  @override
  _$WordsContentCopyWith<_WordsContent> get copyWith =>
      __$WordsContentCopyWithImpl<_WordsContent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function() loading,
    required TResult Function(WordResponseDto wordResponseDto)
        contentFromWordApi,
    required TResult Function(ImageResponseDto imageResponseDto)
        contentFromImageApi,
    required TResult Function(List<Word> listOfWords) content,
    required TResult Function(dynamic message) error,
  }) {
    return content(listOfWords);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
  }) {
    return content?.call(listOfWords);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(listOfWords);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoading value) loading,
    required TResult Function(_ContentFromWordApi value) contentFromWordApi,
    required TResult Function(_ContentFromImageApi value) contentFromImageApi,
    required TResult Function(_WordsContent value) content,
    required TResult Function(_WordsError value) error,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _WordsContent implements WordsState {
  factory _WordsContent(List<Word> listOfWords) = _$_WordsContent;

  List<Word> get listOfWords;
  @JsonKey(ignore: true)
  _$WordsContentCopyWith<_WordsContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WordsErrorCopyWith<$Res> {
  factory _$WordsErrorCopyWith(
          _WordsError value, $Res Function(_WordsError) then) =
      __$WordsErrorCopyWithImpl<$Res>;
  $Res call({dynamic message});
}

/// @nodoc
class __$WordsErrorCopyWithImpl<$Res> extends _$WordsStateCopyWithImpl<$Res>
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
      message == freezed ? _value.message : message,
    ));
  }
}

/// @nodoc

class _$_WordsError implements _WordsError {
  _$_WordsError(this.message);

  @override
  final dynamic message;

  @override
  String toString() {
    return 'WordsState.error(message: $message)';
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
    required TResult Function() loading,
    required TResult Function(WordResponseDto wordResponseDto)
        contentFromWordApi,
    required TResult Function(ImageResponseDto imageResponseDto)
        contentFromImageApi,
    required TResult Function(List<Word> listOfWords) content,
    required TResult Function(dynamic message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function()? loading,
    TResult Function(WordResponseDto wordResponseDto)? contentFromWordApi,
    TResult Function(ImageResponseDto imageResponseDto)? contentFromImageApi,
    TResult Function(List<Word> listOfWords)? content,
    TResult Function(dynamic message)? error,
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
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoading value) loading,
    required TResult Function(_ContentFromWordApi value) contentFromWordApi,
    required TResult Function(_ContentFromImageApi value) contentFromImageApi,
    required TResult Function(_WordsContent value) content,
    required TResult Function(_WordsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoading value)? loading,
    TResult Function(_ContentFromWordApi value)? contentFromWordApi,
    TResult Function(_ContentFromImageApi value)? contentFromImageApi,
    TResult Function(_WordsContent value)? content,
    TResult Function(_WordsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _WordsError implements WordsState {
  factory _WordsError(dynamic message) = _$_WordsError;

  dynamic get message;
  @JsonKey(ignore: true)
  _$WordsErrorCopyWith<_WordsError> get copyWith =>
      throw _privateConstructorUsedError;
}
