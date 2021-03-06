// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoriesEventTearOff {
  const _$CategoriesEventTearOff();

  ChangeIsShop changeIsShop(bool value) {
    return ChangeIsShop(
      value,
    );
  }

  FetchSettings fetchSettings() {
    return FetchSettings();
  }

  ChangeSelectedCategory changeSelectedCategory(String title, int index) {
    return ChangeSelectedCategory(
      title,
      index,
    );
  }

  OpenCategory openCategory(String title) {
    return OpenCategory(
      title,
    );
  }

  FetchCategories fetchCategories() {
    return FetchCategories();
  }

  AddCategory addCategory(String title) {
    return AddCategory(
      title,
    );
  }

  DeleteOrResetCategory deleteOrResetCategory(String title) {
    return DeleteOrResetCategory(
      title,
    );
  }

  EditCategory editCategory(
      String title, String description, int indexIconAsset) {
    return EditCategory(
      title,
      description,
      indexIconAsset,
    );
  }
}

/// @nodoc
const $CategoriesEvent = _$CategoriesEventTearOff();

/// @nodoc
mixin _$CategoriesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesEventCopyWith<$Res> {
  factory $CategoriesEventCopyWith(
          CategoriesEvent value, $Res Function(CategoriesEvent) then) =
      _$CategoriesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoriesEventCopyWithImpl<$Res>
    implements $CategoriesEventCopyWith<$Res> {
  _$CategoriesEventCopyWithImpl(this._value, this._then);

  final CategoriesEvent _value;
  // ignore: unused_field
  final $Res Function(CategoriesEvent) _then;
}

/// @nodoc
abstract class $ChangeIsShopCopyWith<$Res> {
  factory $ChangeIsShopCopyWith(
          ChangeIsShop value, $Res Function(ChangeIsShop) then) =
      _$ChangeIsShopCopyWithImpl<$Res>;
  $Res call({bool value});
}

/// @nodoc
class _$ChangeIsShopCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
    implements $ChangeIsShopCopyWith<$Res> {
  _$ChangeIsShopCopyWithImpl(
      ChangeIsShop _value, $Res Function(ChangeIsShop) _then)
      : super(_value, (v) => _then(v as ChangeIsShop));

  @override
  ChangeIsShop get _value => super._value as ChangeIsShop;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(ChangeIsShop(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeIsShop implements ChangeIsShop {
  _$ChangeIsShop(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'CategoriesEvent.changeIsShop(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeIsShop &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $ChangeIsShopCopyWith<ChangeIsShop> get copyWith =>
      _$ChangeIsShopCopyWithImpl<ChangeIsShop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return changeIsShop(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return changeIsShop?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) {
    if (changeIsShop != null) {
      return changeIsShop(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return changeIsShop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return changeIsShop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (changeIsShop != null) {
      return changeIsShop(this);
    }
    return orElse();
  }
}

abstract class ChangeIsShop implements CategoriesEvent {
  factory ChangeIsShop(bool value) = _$ChangeIsShop;

  bool get value;
  @JsonKey(ignore: true)
  $ChangeIsShopCopyWith<ChangeIsShop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchSettingsCopyWith<$Res> {
  factory $FetchSettingsCopyWith(
          FetchSettings value, $Res Function(FetchSettings) then) =
      _$FetchSettingsCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchSettingsCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
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
    return 'CategoriesEvent.fetchSettings()';
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
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return fetchSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return fetchSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
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
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return fetchSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return fetchSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (fetchSettings != null) {
      return fetchSettings(this);
    }
    return orElse();
  }
}

abstract class FetchSettings implements CategoriesEvent {
  factory FetchSettings() = _$FetchSettings;
}

/// @nodoc
abstract class $ChangeSelectedCategoryCopyWith<$Res> {
  factory $ChangeSelectedCategoryCopyWith(ChangeSelectedCategory value,
          $Res Function(ChangeSelectedCategory) then) =
      _$ChangeSelectedCategoryCopyWithImpl<$Res>;
  $Res call({String title, int index});
}

/// @nodoc
class _$ChangeSelectedCategoryCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
    implements $ChangeSelectedCategoryCopyWith<$Res> {
  _$ChangeSelectedCategoryCopyWithImpl(ChangeSelectedCategory _value,
      $Res Function(ChangeSelectedCategory) _then)
      : super(_value, (v) => _then(v as ChangeSelectedCategory));

  @override
  ChangeSelectedCategory get _value => super._value as ChangeSelectedCategory;

  @override
  $Res call({
    Object? title = freezed,
    Object? index = freezed,
  }) {
    return _then(ChangeSelectedCategory(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeSelectedCategory implements ChangeSelectedCategory {
  _$ChangeSelectedCategory(this.title, this.index);

  @override
  final String title;
  @override
  final int index;

  @override
  String toString() {
    return 'CategoriesEvent.changeSelectedCategory(title: $title, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeSelectedCategory &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  $ChangeSelectedCategoryCopyWith<ChangeSelectedCategory> get copyWith =>
      _$ChangeSelectedCategoryCopyWithImpl<ChangeSelectedCategory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return changeSelectedCategory(title, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return changeSelectedCategory?.call(title, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) {
    if (changeSelectedCategory != null) {
      return changeSelectedCategory(title, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return changeSelectedCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return changeSelectedCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (changeSelectedCategory != null) {
      return changeSelectedCategory(this);
    }
    return orElse();
  }
}

abstract class ChangeSelectedCategory implements CategoriesEvent {
  factory ChangeSelectedCategory(String title, int index) =
      _$ChangeSelectedCategory;

  String get title;
  int get index;
  @JsonKey(ignore: true)
  $ChangeSelectedCategoryCopyWith<ChangeSelectedCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenCategoryCopyWith<$Res> {
  factory $OpenCategoryCopyWith(
          OpenCategory value, $Res Function(OpenCategory) then) =
      _$OpenCategoryCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$OpenCategoryCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
    implements $OpenCategoryCopyWith<$Res> {
  _$OpenCategoryCopyWithImpl(
      OpenCategory _value, $Res Function(OpenCategory) _then)
      : super(_value, (v) => _then(v as OpenCategory));

  @override
  OpenCategory get _value => super._value as OpenCategory;

  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(OpenCategory(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OpenCategory implements OpenCategory {
  _$OpenCategory(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'CategoriesEvent.openCategory(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OpenCategory &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $OpenCategoryCopyWith<OpenCategory> get copyWith =>
      _$OpenCategoryCopyWithImpl<OpenCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return openCategory(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return openCategory?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) {
    if (openCategory != null) {
      return openCategory(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return openCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return openCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (openCategory != null) {
      return openCategory(this);
    }
    return orElse();
  }
}

abstract class OpenCategory implements CategoriesEvent {
  factory OpenCategory(String title) = _$OpenCategory;

  String get title;
  @JsonKey(ignore: true)
  $OpenCategoryCopyWith<OpenCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchCategoriesCopyWith<$Res> {
  factory $FetchCategoriesCopyWith(
          FetchCategories value, $Res Function(FetchCategories) then) =
      _$FetchCategoriesCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchCategoriesCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
    implements $FetchCategoriesCopyWith<$Res> {
  _$FetchCategoriesCopyWithImpl(
      FetchCategories _value, $Res Function(FetchCategories) _then)
      : super(_value, (v) => _then(v as FetchCategories));

  @override
  FetchCategories get _value => super._value as FetchCategories;
}

/// @nodoc

class _$FetchCategories implements FetchCategories {
  _$FetchCategories();

  @override
  String toString() {
    return 'CategoriesEvent.fetchCategories()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return fetchCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return fetchCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) {
    if (fetchCategories != null) {
      return fetchCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return fetchCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return fetchCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (fetchCategories != null) {
      return fetchCategories(this);
    }
    return orElse();
  }
}

abstract class FetchCategories implements CategoriesEvent {
  factory FetchCategories() = _$FetchCategories;
}

/// @nodoc
abstract class $AddCategoryCopyWith<$Res> {
  factory $AddCategoryCopyWith(
          AddCategory value, $Res Function(AddCategory) then) =
      _$AddCategoryCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$AddCategoryCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
    implements $AddCategoryCopyWith<$Res> {
  _$AddCategoryCopyWithImpl(
      AddCategory _value, $Res Function(AddCategory) _then)
      : super(_value, (v) => _then(v as AddCategory));

  @override
  AddCategory get _value => super._value as AddCategory;

  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(AddCategory(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddCategory implements AddCategory {
  _$AddCategory(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'CategoriesEvent.addCategory(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCategory &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $AddCategoryCopyWith<AddCategory> get copyWith =>
      _$AddCategoryCopyWithImpl<AddCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return addCategory(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return addCategory?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return addCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return addCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(this);
    }
    return orElse();
  }
}

abstract class AddCategory implements CategoriesEvent {
  factory AddCategory(String title) = _$AddCategory;

  String get title;
  @JsonKey(ignore: true)
  $AddCategoryCopyWith<AddCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteOrResetCategoryCopyWith<$Res> {
  factory $DeleteOrResetCategoryCopyWith(DeleteOrResetCategory value,
          $Res Function(DeleteOrResetCategory) then) =
      _$DeleteOrResetCategoryCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$DeleteOrResetCategoryCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
    implements $DeleteOrResetCategoryCopyWith<$Res> {
  _$DeleteOrResetCategoryCopyWithImpl(
      DeleteOrResetCategory _value, $Res Function(DeleteOrResetCategory) _then)
      : super(_value, (v) => _then(v as DeleteOrResetCategory));

  @override
  DeleteOrResetCategory get _value => super._value as DeleteOrResetCategory;

  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(DeleteOrResetCategory(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteOrResetCategory implements DeleteOrResetCategory {
  _$DeleteOrResetCategory(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'CategoriesEvent.deleteOrResetCategory(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteOrResetCategory &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $DeleteOrResetCategoryCopyWith<DeleteOrResetCategory> get copyWith =>
      _$DeleteOrResetCategoryCopyWithImpl<DeleteOrResetCategory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return deleteOrResetCategory(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return deleteOrResetCategory?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) {
    if (deleteOrResetCategory != null) {
      return deleteOrResetCategory(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return deleteOrResetCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return deleteOrResetCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (deleteOrResetCategory != null) {
      return deleteOrResetCategory(this);
    }
    return orElse();
  }
}

abstract class DeleteOrResetCategory implements CategoriesEvent {
  factory DeleteOrResetCategory(String title) = _$DeleteOrResetCategory;

  String get title;
  @JsonKey(ignore: true)
  $DeleteOrResetCategoryCopyWith<DeleteOrResetCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCategoryCopyWith<$Res> {
  factory $EditCategoryCopyWith(
          EditCategory value, $Res Function(EditCategory) then) =
      _$EditCategoryCopyWithImpl<$Res>;
  $Res call({String title, String description, int indexIconAsset});
}

/// @nodoc
class _$EditCategoryCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res>
    implements $EditCategoryCopyWith<$Res> {
  _$EditCategoryCopyWithImpl(
      EditCategory _value, $Res Function(EditCategory) _then)
      : super(_value, (v) => _then(v as EditCategory));

  @override
  EditCategory get _value => super._value as EditCategory;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? indexIconAsset = freezed,
  }) {
    return _then(EditCategory(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      indexIconAsset == freezed
          ? _value.indexIconAsset
          : indexIconAsset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EditCategory implements EditCategory {
  _$EditCategory(this.title, this.description, this.indexIconAsset);

  @override
  final String title;
  @override
  final String description;
  @override
  final int indexIconAsset;

  @override
  String toString() {
    return 'CategoriesEvent.editCategory(title: $title, description: $description, indexIconAsset: $indexIconAsset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditCategory &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.indexIconAsset, indexIconAsset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(indexIconAsset));

  @JsonKey(ignore: true)
  @override
  $EditCategoryCopyWith<EditCategory> get copyWith =>
      _$EditCategoryCopyWithImpl<EditCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) changeIsShop,
    required TResult Function() fetchSettings,
    required TResult Function(String title, int index) changeSelectedCategory,
    required TResult Function(String title) openCategory,
    required TResult Function() fetchCategories,
    required TResult Function(String title) addCategory,
    required TResult Function(String title) deleteOrResetCategory,
    required TResult Function(
            String title, String description, int indexIconAsset)
        editCategory,
  }) {
    return editCategory(title, description, indexIconAsset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
  }) {
    return editCategory?.call(title, description, indexIconAsset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? changeIsShop,
    TResult Function()? fetchSettings,
    TResult Function(String title, int index)? changeSelectedCategory,
    TResult Function(String title)? openCategory,
    TResult Function()? fetchCategories,
    TResult Function(String title)? addCategory,
    TResult Function(String title)? deleteOrResetCategory,
    TResult Function(String title, String description, int indexIconAsset)?
        editCategory,
    required TResult orElse(),
  }) {
    if (editCategory != null) {
      return editCategory(title, description, indexIconAsset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIsShop value) changeIsShop,
    required TResult Function(FetchSettings value) fetchSettings,
    required TResult Function(ChangeSelectedCategory value)
        changeSelectedCategory,
    required TResult Function(OpenCategory value) openCategory,
    required TResult Function(FetchCategories value) fetchCategories,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(DeleteOrResetCategory value)
        deleteOrResetCategory,
    required TResult Function(EditCategory value) editCategory,
  }) {
    return editCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
  }) {
    return editCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIsShop value)? changeIsShop,
    TResult Function(FetchSettings value)? fetchSettings,
    TResult Function(ChangeSelectedCategory value)? changeSelectedCategory,
    TResult Function(OpenCategory value)? openCategory,
    TResult Function(FetchCategories value)? fetchCategories,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(DeleteOrResetCategory value)? deleteOrResetCategory,
    TResult Function(EditCategory value)? editCategory,
    required TResult orElse(),
  }) {
    if (editCategory != null) {
      return editCategory(this);
    }
    return orElse();
  }
}

abstract class EditCategory implements CategoriesEvent {
  factory EditCategory(String title, String description, int indexIconAsset) =
      _$EditCategory;

  String get title;
  String get description;
  int get indexIconAsset;
  @JsonKey(ignore: true)
  $EditCategoryCopyWith<EditCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CategoriesStateTearOff {
  const _$CategoriesStateTearOff();

  _InitCategoriesState initState() {
    return _InitCategoriesState();
  }

  _CategoriesLoaded loaded(List<Category> categories, int selectedIndex) {
    return _CategoriesLoaded(
      categories,
      selectedIndex,
    );
  }

  _CategoriesEmpty empty() {
    return _CategoriesEmpty();
  }

  _CategoriesError error(String message) {
    return _CategoriesError(
      message,
    );
  }

  _CategoriesSuccess success(String message) {
    return _CategoriesSuccess(
      message,
    );
  }
}

/// @nodoc
const $CategoriesState = _$CategoriesStateTearOff();

/// @nodoc
mixin _$CategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Category> categories, int selectedIndex)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCategoriesState value) initState,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesEmpty value) empty,
    required TResult Function(_CategoriesError value) error,
    required TResult Function(_CategoriesSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  final CategoriesState _value;
  // ignore: unused_field
  final $Res Function(CategoriesState) _then;
}

/// @nodoc
abstract class _$InitCategoriesStateCopyWith<$Res> {
  factory _$InitCategoriesStateCopyWith(_InitCategoriesState value,
          $Res Function(_InitCategoriesState) then) =
      __$InitCategoriesStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitCategoriesStateCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$InitCategoriesStateCopyWith<$Res> {
  __$InitCategoriesStateCopyWithImpl(
      _InitCategoriesState _value, $Res Function(_InitCategoriesState) _then)
      : super(_value, (v) => _then(v as _InitCategoriesState));

  @override
  _InitCategoriesState get _value => super._value as _InitCategoriesState;
}

/// @nodoc

class _$_InitCategoriesState implements _InitCategoriesState {
  _$_InitCategoriesState();

  @override
  String toString() {
    return 'CategoriesState.initState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitCategoriesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Category> categories, int selectedIndex)
        loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    required TResult Function(_InitCategoriesState value) initState,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesEmpty value) empty,
    required TResult Function(_CategoriesError value) error,
    required TResult Function(_CategoriesSuccess value) success,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(this);
    }
    return orElse();
  }
}

abstract class _InitCategoriesState implements CategoriesState {
  factory _InitCategoriesState() = _$_InitCategoriesState;
}

/// @nodoc
abstract class _$CategoriesLoadedCopyWith<$Res> {
  factory _$CategoriesLoadedCopyWith(
          _CategoriesLoaded value, $Res Function(_CategoriesLoaded) then) =
      __$CategoriesLoadedCopyWithImpl<$Res>;
  $Res call({List<Category> categories, int selectedIndex});
}

/// @nodoc
class __$CategoriesLoadedCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesLoadedCopyWith<$Res> {
  __$CategoriesLoadedCopyWithImpl(
      _CategoriesLoaded _value, $Res Function(_CategoriesLoaded) _then)
      : super(_value, (v) => _then(v as _CategoriesLoaded));

  @override
  _CategoriesLoaded get _value => super._value as _CategoriesLoaded;

  @override
  $Res call({
    Object? categories = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_CategoriesLoaded(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CategoriesLoaded implements _CategoriesLoaded {
  _$_CategoriesLoaded(this.categories, this.selectedIndex);

  @override
  final List<Category> categories;
  @override
  final int selectedIndex;

  @override
  String toString() {
    return 'CategoriesState.loaded(categories: $categories, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesLoaded &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.selectedIndex, selectedIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(selectedIndex));

  @JsonKey(ignore: true)
  @override
  _$CategoriesLoadedCopyWith<_CategoriesLoaded> get copyWith =>
      __$CategoriesLoadedCopyWithImpl<_CategoriesLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Category> categories, int selectedIndex)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return loaded(categories, selectedIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
  }) {
    return loaded?.call(categories, selectedIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initState,
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories, selectedIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCategoriesState value) initState,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesEmpty value) empty,
    required TResult Function(_CategoriesError value) error,
    required TResult Function(_CategoriesSuccess value) success,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _CategoriesLoaded implements CategoriesState {
  factory _CategoriesLoaded(List<Category> categories, int selectedIndex) =
      _$_CategoriesLoaded;

  List<Category> get categories;
  int get selectedIndex;
  @JsonKey(ignore: true)
  _$CategoriesLoadedCopyWith<_CategoriesLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CategoriesEmptyCopyWith<$Res> {
  factory _$CategoriesEmptyCopyWith(
          _CategoriesEmpty value, $Res Function(_CategoriesEmpty) then) =
      __$CategoriesEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$CategoriesEmptyCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesEmptyCopyWith<$Res> {
  __$CategoriesEmptyCopyWithImpl(
      _CategoriesEmpty _value, $Res Function(_CategoriesEmpty) _then)
      : super(_value, (v) => _then(v as _CategoriesEmpty));

  @override
  _CategoriesEmpty get _value => super._value as _CategoriesEmpty;
}

/// @nodoc

class _$_CategoriesEmpty implements _CategoriesEmpty {
  _$_CategoriesEmpty();

  @override
  String toString() {
    return 'CategoriesState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CategoriesEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Category> categories, int selectedIndex)
        loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    required TResult Function(_InitCategoriesState value) initState,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesEmpty value) empty,
    required TResult Function(_CategoriesError value) error,
    required TResult Function(_CategoriesSuccess value) success,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _CategoriesEmpty implements CategoriesState {
  factory _CategoriesEmpty() = _$_CategoriesEmpty;
}

/// @nodoc
abstract class _$CategoriesErrorCopyWith<$Res> {
  factory _$CategoriesErrorCopyWith(
          _CategoriesError value, $Res Function(_CategoriesError) then) =
      __$CategoriesErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$CategoriesErrorCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesErrorCopyWith<$Res> {
  __$CategoriesErrorCopyWithImpl(
      _CategoriesError _value, $Res Function(_CategoriesError) _then)
      : super(_value, (v) => _then(v as _CategoriesError));

  @override
  _CategoriesError get _value => super._value as _CategoriesError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_CategoriesError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CategoriesError implements _CategoriesError {
  _$_CategoriesError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CategoriesState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$CategoriesErrorCopyWith<_CategoriesError> get copyWith =>
      __$CategoriesErrorCopyWithImpl<_CategoriesError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Category> categories, int selectedIndex)
        loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    required TResult Function(_InitCategoriesState value) initState,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesEmpty value) empty,
    required TResult Function(_CategoriesError value) error,
    required TResult Function(_CategoriesSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _CategoriesError implements CategoriesState {
  factory _CategoriesError(String message) = _$_CategoriesError;

  String get message;
  @JsonKey(ignore: true)
  _$CategoriesErrorCopyWith<_CategoriesError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CategoriesSuccessCopyWith<$Res> {
  factory _$CategoriesSuccessCopyWith(
          _CategoriesSuccess value, $Res Function(_CategoriesSuccess) then) =
      __$CategoriesSuccessCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$CategoriesSuccessCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesSuccessCopyWith<$Res> {
  __$CategoriesSuccessCopyWithImpl(
      _CategoriesSuccess _value, $Res Function(_CategoriesSuccess) _then)
      : super(_value, (v) => _then(v as _CategoriesSuccess));

  @override
  _CategoriesSuccess get _value => super._value as _CategoriesSuccess;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_CategoriesSuccess(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CategoriesSuccess implements _CategoriesSuccess {
  _$_CategoriesSuccess(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CategoriesState.success(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesSuccess &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$CategoriesSuccessCopyWith<_CategoriesSuccess> get copyWith =>
      __$CategoriesSuccessCopyWithImpl<_CategoriesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initState,
    required TResult Function(List<Category> categories, int selectedIndex)
        loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    TResult Function(List<Category> categories, int selectedIndex)? loaded,
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
    required TResult Function(_InitCategoriesState value) initState,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesEmpty value) empty,
    required TResult Function(_CategoriesError value) error,
    required TResult Function(_CategoriesSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCategoriesState value)? initState,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesEmpty value)? empty,
    TResult Function(_CategoriesError value)? error,
    TResult Function(_CategoriesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _CategoriesSuccess implements CategoriesState {
  factory _CategoriesSuccess(String message) = _$_CategoriesSuccess;

  String get message;
  @JsonKey(ignore: true)
  _$CategoriesSuccessCopyWith<_CategoriesSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
