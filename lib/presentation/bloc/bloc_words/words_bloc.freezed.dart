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

  AddSelectedItem addSelectedItem(Word item, dynamic indexUrl) {
    return AddSelectedItem(
      item,
      indexUrl,
    );
  }

  RemoveSelectedItem removeSelectedItem(Word item) {
    return RemoveSelectedItem(
      item,
    );
  }

  ClearSelectedItems clearSelectedItems() {
    return ClearSelectedItems();
  }

  ChangeType changeType(String type) {
    return ChangeType(
      type,
    );
  }

  FetchAllWords fetchAllWords() {
    return FetchAllWords();
  }

  FetchWordsByKeyword fetchWordsByKeyword(String keyword) {
    return FetchWordsByKeyword(
      keyword,
    );
  }

  AddWord addWord(String title) {
    return AddWord(
      title,
    );
  }

  DeleteWords deleteWords() {
    return DeleteWords();
  }

  AddWordsInExplore addWordsInExplore() {
    return AddWordsInExplore();
  }

  RemoveWordsFromExplore removeWordsFromExplore() {
    return RemoveWordsFromExplore();
  }
}

/// @nodoc
const $WordsEvent = _$WordsEventTearOff();

/// @nodoc
mixin _$WordsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
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
abstract class $AddSelectedItemCopyWith<$Res> {
  factory $AddSelectedItemCopyWith(
          AddSelectedItem value, $Res Function(AddSelectedItem) then) =
      _$AddSelectedItemCopyWithImpl<$Res>;
  $Res call({Word item, dynamic indexUrl});
}

/// @nodoc
class _$AddSelectedItemCopyWithImpl<$Res> extends _$WordsEventCopyWithImpl<$Res>
    implements $AddSelectedItemCopyWith<$Res> {
  _$AddSelectedItemCopyWithImpl(
      AddSelectedItem _value, $Res Function(AddSelectedItem) _then)
      : super(_value, (v) => _then(v as AddSelectedItem));

  @override
  AddSelectedItem get _value => super._value as AddSelectedItem;

  @override
  $Res call({
    Object? item = freezed,
    Object? indexUrl = freezed,
  }) {
    return _then(AddSelectedItem(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Word,
      indexUrl == freezed ? _value.indexUrl : indexUrl,
    ));
  }
}

/// @nodoc

class _$AddSelectedItem implements AddSelectedItem {
  _$AddSelectedItem(this.item, this.indexUrl);

  @override
  final Word item;
  @override
  final dynamic indexUrl;

  @override
  String toString() {
    return 'WordsEvent.addSelectedItem(item: $item, indexUrl: $indexUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddSelectedItem &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.indexUrl, indexUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(indexUrl));

  @JsonKey(ignore: true)
  @override
  $AddSelectedItemCopyWith<AddSelectedItem> get copyWith =>
      _$AddSelectedItemCopyWithImpl<AddSelectedItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return addSelectedItem(item, indexUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return addSelectedItem?.call(item, indexUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (addSelectedItem != null) {
      return addSelectedItem(item, indexUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return addSelectedItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return addSelectedItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (addSelectedItem != null) {
      return addSelectedItem(this);
    }
    return orElse();
  }
}

abstract class AddSelectedItem implements WordsEvent {
  factory AddSelectedItem(Word item, dynamic indexUrl) = _$AddSelectedItem;

  Word get item;
  dynamic get indexUrl;
  @JsonKey(ignore: true)
  $AddSelectedItemCopyWith<AddSelectedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveSelectedItemCopyWith<$Res> {
  factory $RemoveSelectedItemCopyWith(
          RemoveSelectedItem value, $Res Function(RemoveSelectedItem) then) =
      _$RemoveSelectedItemCopyWithImpl<$Res>;
  $Res call({Word item});
}

/// @nodoc
class _$RemoveSelectedItemCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res>
    implements $RemoveSelectedItemCopyWith<$Res> {
  _$RemoveSelectedItemCopyWithImpl(
      RemoveSelectedItem _value, $Res Function(RemoveSelectedItem) _then)
      : super(_value, (v) => _then(v as RemoveSelectedItem));

  @override
  RemoveSelectedItem get _value => super._value as RemoveSelectedItem;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(RemoveSelectedItem(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Word,
    ));
  }
}

/// @nodoc

class _$RemoveSelectedItem implements RemoveSelectedItem {
  _$RemoveSelectedItem(this.item);

  @override
  final Word item;

  @override
  String toString() {
    return 'WordsEvent.removeSelectedItem(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveSelectedItem &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  $RemoveSelectedItemCopyWith<RemoveSelectedItem> get copyWith =>
      _$RemoveSelectedItemCopyWithImpl<RemoveSelectedItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return removeSelectedItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return removeSelectedItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (removeSelectedItem != null) {
      return removeSelectedItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return removeSelectedItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return removeSelectedItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (removeSelectedItem != null) {
      return removeSelectedItem(this);
    }
    return orElse();
  }
}

abstract class RemoveSelectedItem implements WordsEvent {
  factory RemoveSelectedItem(Word item) = _$RemoveSelectedItem;

  Word get item;
  @JsonKey(ignore: true)
  $RemoveSelectedItemCopyWith<RemoveSelectedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClearSelectedItemsCopyWith<$Res> {
  factory $ClearSelectedItemsCopyWith(
          ClearSelectedItems value, $Res Function(ClearSelectedItems) then) =
      _$ClearSelectedItemsCopyWithImpl<$Res>;
}

/// @nodoc
class _$ClearSelectedItemsCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res>
    implements $ClearSelectedItemsCopyWith<$Res> {
  _$ClearSelectedItemsCopyWithImpl(
      ClearSelectedItems _value, $Res Function(ClearSelectedItems) _then)
      : super(_value, (v) => _then(v as ClearSelectedItems));

  @override
  ClearSelectedItems get _value => super._value as ClearSelectedItems;
}

/// @nodoc

class _$ClearSelectedItems implements ClearSelectedItems {
  _$ClearSelectedItems();

  @override
  String toString() {
    return 'WordsEvent.clearSelectedItems()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearSelectedItems);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return clearSelectedItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return clearSelectedItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (clearSelectedItems != null) {
      return clearSelectedItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return clearSelectedItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return clearSelectedItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (clearSelectedItems != null) {
      return clearSelectedItems(this);
    }
    return orElse();
  }
}

abstract class ClearSelectedItems implements WordsEvent {
  factory ClearSelectedItems() = _$ClearSelectedItems;
}

/// @nodoc
abstract class $ChangeTypeCopyWith<$Res> {
  factory $ChangeTypeCopyWith(
          ChangeType value, $Res Function(ChangeType) then) =
      _$ChangeTypeCopyWithImpl<$Res>;
  $Res call({String type});
}

/// @nodoc
class _$ChangeTypeCopyWithImpl<$Res> extends _$WordsEventCopyWithImpl<$Res>
    implements $ChangeTypeCopyWith<$Res> {
  _$ChangeTypeCopyWithImpl(ChangeType _value, $Res Function(ChangeType) _then)
      : super(_value, (v) => _then(v as ChangeType));

  @override
  ChangeType get _value => super._value as ChangeType;

  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(ChangeType(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeType implements ChangeType {
  _$ChangeType(this.type);

  @override
  final String type;

  @override
  String toString() {
    return 'WordsEvent.changeType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeType &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  $ChangeTypeCopyWith<ChangeType> get copyWith =>
      _$ChangeTypeCopyWithImpl<ChangeType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return changeType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return changeType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (changeType != null) {
      return changeType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return changeType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return changeType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (changeType != null) {
      return changeType(this);
    }
    return orElse();
  }
}

abstract class ChangeType implements WordsEvent {
  factory ChangeType(String type) = _$ChangeType;

  String get type;
  @JsonKey(ignore: true)
  $ChangeTypeCopyWith<ChangeType> get copyWith =>
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
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return fetchAllWords();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return fetchAllWords?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
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
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return fetchAllWords(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return fetchAllWords?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
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
abstract class $FetchWordsByKeywordCopyWith<$Res> {
  factory $FetchWordsByKeywordCopyWith(
          FetchWordsByKeyword value, $Res Function(FetchWordsByKeyword) then) =
      _$FetchWordsByKeywordCopyWithImpl<$Res>;
  $Res call({String keyword});
}

/// @nodoc
class _$FetchWordsByKeywordCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res>
    implements $FetchWordsByKeywordCopyWith<$Res> {
  _$FetchWordsByKeywordCopyWithImpl(
      FetchWordsByKeyword _value, $Res Function(FetchWordsByKeyword) _then)
      : super(_value, (v) => _then(v as FetchWordsByKeyword));

  @override
  FetchWordsByKeyword get _value => super._value as FetchWordsByKeyword;

  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(FetchWordsByKeyword(
      keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchWordsByKeyword implements FetchWordsByKeyword {
  _$FetchWordsByKeyword(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'WordsEvent.fetchWordsByKeyword(keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchWordsByKeyword &&
            const DeepCollectionEquality().equals(other.keyword, keyword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keyword));

  @JsonKey(ignore: true)
  @override
  $FetchWordsByKeywordCopyWith<FetchWordsByKeyword> get copyWith =>
      _$FetchWordsByKeywordCopyWithImpl<FetchWordsByKeyword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return fetchWordsByKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return fetchWordsByKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (fetchWordsByKeyword != null) {
      return fetchWordsByKeyword(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return fetchWordsByKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return fetchWordsByKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (fetchWordsByKeyword != null) {
      return fetchWordsByKeyword(this);
    }
    return orElse();
  }
}

abstract class FetchWordsByKeyword implements WordsEvent {
  factory FetchWordsByKeyword(String keyword) = _$FetchWordsByKeyword;

  String get keyword;
  @JsonKey(ignore: true)
  $FetchWordsByKeywordCopyWith<FetchWordsByKeyword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWordCopyWith<$Res> {
  factory $AddWordCopyWith(AddWord value, $Res Function(AddWord) then) =
      _$AddWordCopyWithImpl<$Res>;
  $Res call({String title});
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
    Object? title = freezed,
  }) {
    return _then(AddWord(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddWord implements AddWord {
  _$AddWord(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'WordsEvent.addWord(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddWord &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $AddWordCopyWith<AddWord> get copyWith =>
      _$AddWordCopyWithImpl<AddWord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return addWord(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return addWord?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (addWord != null) {
      return addWord(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return addWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return addWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (addWord != null) {
      return addWord(this);
    }
    return orElse();
  }
}

abstract class AddWord implements WordsEvent {
  factory AddWord(String title) = _$AddWord;

  String get title;
  @JsonKey(ignore: true)
  $AddWordCopyWith<AddWord> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteWordsCopyWith<$Res> {
  factory $DeleteWordsCopyWith(
          DeleteWords value, $Res Function(DeleteWords) then) =
      _$DeleteWordsCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeleteWordsCopyWithImpl<$Res> extends _$WordsEventCopyWithImpl<$Res>
    implements $DeleteWordsCopyWith<$Res> {
  _$DeleteWordsCopyWithImpl(
      DeleteWords _value, $Res Function(DeleteWords) _then)
      : super(_value, (v) => _then(v as DeleteWords));

  @override
  DeleteWords get _value => super._value as DeleteWords;
}

/// @nodoc

class _$DeleteWords implements DeleteWords {
  _$DeleteWords();

  @override
  String toString() {
    return 'WordsEvent.deleteWords()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteWords);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return deleteWords();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return deleteWords?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (deleteWords != null) {
      return deleteWords();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return deleteWords(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return deleteWords?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (deleteWords != null) {
      return deleteWords(this);
    }
    return orElse();
  }
}

abstract class DeleteWords implements WordsEvent {
  factory DeleteWords() = _$DeleteWords;
}

/// @nodoc
abstract class $AddWordsInExploreCopyWith<$Res> {
  factory $AddWordsInExploreCopyWith(
          AddWordsInExplore value, $Res Function(AddWordsInExplore) then) =
      _$AddWordsInExploreCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddWordsInExploreCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res>
    implements $AddWordsInExploreCopyWith<$Res> {
  _$AddWordsInExploreCopyWithImpl(
      AddWordsInExplore _value, $Res Function(AddWordsInExplore) _then)
      : super(_value, (v) => _then(v as AddWordsInExplore));

  @override
  AddWordsInExplore get _value => super._value as AddWordsInExplore;
}

/// @nodoc

class _$AddWordsInExplore implements AddWordsInExplore {
  _$AddWordsInExplore();

  @override
  String toString() {
    return 'WordsEvent.addWordsInExplore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddWordsInExplore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return addWordsInExplore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return addWordsInExplore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (addWordsInExplore != null) {
      return addWordsInExplore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return addWordsInExplore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return addWordsInExplore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (addWordsInExplore != null) {
      return addWordsInExplore(this);
    }
    return orElse();
  }
}

abstract class AddWordsInExplore implements WordsEvent {
  factory AddWordsInExplore() = _$AddWordsInExplore;
}

/// @nodoc
abstract class $RemoveWordsFromExploreCopyWith<$Res> {
  factory $RemoveWordsFromExploreCopyWith(RemoveWordsFromExplore value,
          $Res Function(RemoveWordsFromExplore) then) =
      _$RemoveWordsFromExploreCopyWithImpl<$Res>;
}

/// @nodoc
class _$RemoveWordsFromExploreCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res>
    implements $RemoveWordsFromExploreCopyWith<$Res> {
  _$RemoveWordsFromExploreCopyWithImpl(RemoveWordsFromExplore _value,
      $Res Function(RemoveWordsFromExplore) _then)
      : super(_value, (v) => _then(v as RemoveWordsFromExplore));

  @override
  RemoveWordsFromExplore get _value => super._value as RemoveWordsFromExplore;
}

/// @nodoc

class _$RemoveWordsFromExplore implements RemoveWordsFromExplore {
  _$RemoveWordsFromExplore();

  @override
  String toString() {
    return 'WordsEvent.removeWordsFromExplore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RemoveWordsFromExplore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Word item, dynamic indexUrl) addSelectedItem,
    required TResult Function(Word item) removeSelectedItem,
    required TResult Function() clearSelectedItems,
    required TResult Function(String type) changeType,
    required TResult Function() fetchAllWords,
    required TResult Function(String keyword) fetchWordsByKeyword,
    required TResult Function(String title) addWord,
    required TResult Function() deleteWords,
    required TResult Function() addWordsInExplore,
    required TResult Function() removeWordsFromExplore,
  }) {
    return removeWordsFromExplore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
  }) {
    return removeWordsFromExplore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Word item, dynamic indexUrl)? addSelectedItem,
    TResult Function(Word item)? removeSelectedItem,
    TResult Function()? clearSelectedItems,
    TResult Function(String type)? changeType,
    TResult Function()? fetchAllWords,
    TResult Function(String keyword)? fetchWordsByKeyword,
    TResult Function(String title)? addWord,
    TResult Function()? deleteWords,
    TResult Function()? addWordsInExplore,
    TResult Function()? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (removeWordsFromExplore != null) {
      return removeWordsFromExplore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddSelectedItem value) addSelectedItem,
    required TResult Function(RemoveSelectedItem value) removeSelectedItem,
    required TResult Function(ClearSelectedItems value) clearSelectedItems,
    required TResult Function(ChangeType value) changeType,
    required TResult Function(FetchAllWords value) fetchAllWords,
    required TResult Function(FetchWordsByKeyword value) fetchWordsByKeyword,
    required TResult Function(AddWord value) addWord,
    required TResult Function(DeleteWords value) deleteWords,
    required TResult Function(AddWordsInExplore value) addWordsInExplore,
    required TResult Function(RemoveWordsFromExplore value)
        removeWordsFromExplore,
  }) {
    return removeWordsFromExplore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
  }) {
    return removeWordsFromExplore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddSelectedItem value)? addSelectedItem,
    TResult Function(RemoveSelectedItem value)? removeSelectedItem,
    TResult Function(ClearSelectedItems value)? clearSelectedItems,
    TResult Function(ChangeType value)? changeType,
    TResult Function(FetchAllWords value)? fetchAllWords,
    TResult Function(FetchWordsByKeyword value)? fetchWordsByKeyword,
    TResult Function(AddWord value)? addWord,
    TResult Function(DeleteWords value)? deleteWords,
    TResult Function(AddWordsInExplore value)? addWordsInExplore,
    TResult Function(RemoveWordsFromExplore value)? removeWordsFromExplore,
    required TResult orElse(),
  }) {
    if (removeWordsFromExplore != null) {
      return removeWordsFromExplore(this);
    }
    return orElse();
  }
}

abstract class RemoveWordsFromExplore implements WordsEvent {
  factory RemoveWordsFromExplore() = _$RemoveWordsFromExplore;
}

/// @nodoc
class _$WordsStateTearOff {
  const _$WordsStateTearOff();

  _InitWordsState initState() {
    return _InitWordsState();
  }

  _WordsLoaded loaded(List<Word> wordList, int selectedItems) {
    return _WordsLoaded(
      wordList,
      selectedItems,
    );
  }

  _WordsEmpty empty() {
    return _WordsEmpty();
  }

  _WordsError error(String message) {
    return _WordsError(
      message,
    );
  }

  _WordsSuccess success(String message) {
    return _WordsSuccess(
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
    required TResult Function(List<Word> wordList, int selectedItems) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoaded value) loaded,
    required TResult Function(_WordsEmpty value) empty,
    required TResult Function(_WordsError value) error,
    required TResult Function(_WordsSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
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
    required TResult Function(List<Word> wordList, int selectedItems) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return initState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) {
    return initState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
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
    required TResult Function(_WordsLoaded value) loaded,
    required TResult Function(_WordsEmpty value) empty,
    required TResult Function(_WordsError value) error,
    required TResult Function(_WordsSuccess value) success,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
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
abstract class _$WordsLoadedCopyWith<$Res> {
  factory _$WordsLoadedCopyWith(
          _WordsLoaded value, $Res Function(_WordsLoaded) then) =
      __$WordsLoadedCopyWithImpl<$Res>;
  $Res call({List<Word> wordList, int selectedItems});
}

/// @nodoc
class __$WordsLoadedCopyWithImpl<$Res> extends _$WordsStateCopyWithImpl<$Res>
    implements _$WordsLoadedCopyWith<$Res> {
  __$WordsLoadedCopyWithImpl(
      _WordsLoaded _value, $Res Function(_WordsLoaded) _then)
      : super(_value, (v) => _then(v as _WordsLoaded));

  @override
  _WordsLoaded get _value => super._value as _WordsLoaded;

  @override
  $Res call({
    Object? wordList = freezed,
    Object? selectedItems = freezed,
  }) {
    return _then(_WordsLoaded(
      wordList == freezed
          ? _value.wordList
          : wordList // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      selectedItems == freezed
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WordsLoaded implements _WordsLoaded {
  _$_WordsLoaded(this.wordList, this.selectedItems);

  @override
  final List<Word> wordList;
  @override
  final int selectedItems;

  @override
  String toString() {
    return 'WordsState.loaded(wordList: $wordList, selectedItems: $selectedItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordsLoaded &&
            const DeepCollectionEquality().equals(other.wordList, wordList) &&
            const DeepCollectionEquality()
                .equals(other.selectedItems, selectedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordList),
      const DeepCollectionEquality().hash(selectedItems));

  @JsonKey(ignore: true)
  @override
  _$WordsLoadedCopyWith<_WordsLoaded> get copyWith =>
      __$WordsLoadedCopyWithImpl<_WordsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Word> wordList, int selectedItems) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return loaded(wordList, selectedItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) {
    return loaded?.call(wordList, selectedItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(wordList, selectedItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoaded value) loaded,
    required TResult Function(_WordsEmpty value) empty,
    required TResult Function(_WordsError value) error,
    required TResult Function(_WordsSuccess value) success,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _WordsLoaded implements WordsState {
  factory _WordsLoaded(List<Word> wordList, int selectedItems) = _$_WordsLoaded;

  List<Word> get wordList;
  int get selectedItems;
  @JsonKey(ignore: true)
  _$WordsLoadedCopyWith<_WordsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WordsEmptyCopyWith<$Res> {
  factory _$WordsEmptyCopyWith(
          _WordsEmpty value, $Res Function(_WordsEmpty) then) =
      __$WordsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$WordsEmptyCopyWithImpl<$Res> extends _$WordsStateCopyWithImpl<$Res>
    implements _$WordsEmptyCopyWith<$Res> {
  __$WordsEmptyCopyWithImpl(
      _WordsEmpty _value, $Res Function(_WordsEmpty) _then)
      : super(_value, (v) => _then(v as _WordsEmpty));

  @override
  _WordsEmpty get _value => super._value as _WordsEmpty;
}

/// @nodoc

class _$_WordsEmpty implements _WordsEmpty {
  _$_WordsEmpty();

  @override
  String toString() {
    return 'WordsState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WordsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Word> wordList, int selectedItems) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoaded value) loaded,
    required TResult Function(_WordsEmpty value) empty,
    required TResult Function(_WordsError value) error,
    required TResult Function(_WordsSuccess value) success,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _WordsEmpty implements WordsState {
  factory _WordsEmpty() = _$_WordsEmpty;
}

/// @nodoc
abstract class _$WordsErrorCopyWith<$Res> {
  factory _$WordsErrorCopyWith(
          _WordsError value, $Res Function(_WordsError) then) =
      __$WordsErrorCopyWithImpl<$Res>;
  $Res call({String message});
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
    required TResult Function(List<Word> wordList, int selectedItems) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
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
    required TResult Function(_WordsLoaded value) loaded,
    required TResult Function(_WordsEmpty value) empty,
    required TResult Function(_WordsError value) error,
    required TResult Function(_WordsSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _WordsError implements WordsState {
  factory _WordsError(String message) = _$_WordsError;

  String get message;
  @JsonKey(ignore: true)
  _$WordsErrorCopyWith<_WordsError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WordsSuccessCopyWith<$Res> {
  factory _$WordsSuccessCopyWith(
          _WordsSuccess value, $Res Function(_WordsSuccess) then) =
      __$WordsSuccessCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$WordsSuccessCopyWithImpl<$Res> extends _$WordsStateCopyWithImpl<$Res>
    implements _$WordsSuccessCopyWith<$Res> {
  __$WordsSuccessCopyWithImpl(
      _WordsSuccess _value, $Res Function(_WordsSuccess) _then)
      : super(_value, (v) => _then(v as _WordsSuccess));

  @override
  _WordsSuccess get _value => super._value as _WordsSuccess;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_WordsSuccess(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WordsSuccess implements _WordsSuccess {
  _$_WordsSuccess(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WordsState.success(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordsSuccess &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$WordsSuccessCopyWith<_WordsSuccess> get copyWith =>
      __$WordsSuccessCopyWithImpl<_WordsSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Word> wordList, int selectedItems) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Word> wordList, int selectedItems)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitWordsState value) initState,
    required TResult Function(_WordsLoaded value) loaded,
    required TResult Function(_WordsEmpty value) empty,
    required TResult Function(_WordsError value) error,
    required TResult Function(_WordsSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitWordsState value)? initState,
    TResult Function(_WordsLoaded value)? loaded,
    TResult Function(_WordsEmpty value)? empty,
    TResult Function(_WordsError value)? error,
    TResult Function(_WordsSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _WordsSuccess implements WordsState {
  factory _WordsSuccess(String message) = _$_WordsSuccess;

  String get message;
  @JsonKey(ignore: true)
  _$WordsSuccessCopyWith<_WordsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
