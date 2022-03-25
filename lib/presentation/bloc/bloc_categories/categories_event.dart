part of 'categories_bloc.dart';

@freezed
abstract class CategoriesEvent with _$CategoriesEvent {

  factory CategoriesEvent.changeIsShop(bool value) = ChangeIsShop;

  factory CategoriesEvent.fetchSettings() = FetchSettings;

  factory CategoriesEvent.changeSelectedCategory(String title, int index) = ChangeSelectedCategory;

  factory CategoriesEvent.changeSelectedCategoryShop(String title, int index) = ChangeSelectedCategoryShop;

  factory CategoriesEvent.openCategory(String title) = OpenCategory;

  factory CategoriesEvent.resetStudiedWords(String title) = ResetStudiedWords;

  factory CategoriesEvent.fetchCategories() = FetchCategories;

  factory CategoriesEvent.addCategory(String title) = AddCategory;

  factory CategoriesEvent.deleteCategory(String title) = DeleteCategory;
}
