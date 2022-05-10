part of 'categories_bloc.dart';

@freezed
abstract class CategoriesEvent with _$CategoriesEvent {

  factory CategoriesEvent.changeIsShop(bool value) = ChangeIsShop;

  factory CategoriesEvent.fetchSettings() = FetchSettings;

  factory CategoriesEvent.changeSelectedCategory(String title, int index) = ChangeSelectedCategory;

  factory CategoriesEvent.openCategory(String title) = OpenCategory;

  factory CategoriesEvent.fetchCategories() = FetchCategories;

  factory CategoriesEvent.addCategory(String title) = AddCategory;

  factory CategoriesEvent.deleteOrResetCategory(String title) = DeleteOrResetCategory;

  factory CategoriesEvent.editCategory(String title, String description, int indexIconAsset) = EditCategory;
}
