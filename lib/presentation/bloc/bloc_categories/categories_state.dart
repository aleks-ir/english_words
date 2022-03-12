part of 'categories_bloc.dart';

@freezed
abstract class CategoriesState with _$CategoriesState {

  factory CategoriesState.initState() = _InitCategoriesState;

  factory CategoriesState.loaded(List<Category> categories, int selectedIndex) = _CategoriesLoaded;

  factory CategoriesState.empty() = _CategoriesEmpty;

  factory CategoriesState.error(String message) = _CategoriesError;

  factory CategoriesState.success(String message) = _CategoriesSuccess;
}
