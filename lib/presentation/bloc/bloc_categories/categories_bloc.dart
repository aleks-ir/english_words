import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:words_3000_puzzle/common/constants/word_status.dart';

import '../../../common/constants/default.dart';
import '../../../domain/models/category.dart';
import '../../../domain/models/settings.dart';
import '../../../domain/usecases/categories/create_category_usecase.dart';
import '../../../domain/usecases/categories/delete_category_usecase.dart';
import '../../../domain/usecases/categories/fetch_all_categories_usecase.dart';
import '../../../domain/usecases/categories/fetch_category_usecase.dart';
import '../../../domain/usecases/categories/update_category_usecase.dart';
import '../../../domain/usecases/settings/fetch_settings.dart';
import '../../../domain/usecases/settings/update_settings.dart';

part 'categories_bloc.freezed.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  late Settings settings;
  bool isShop = false;
  int selectedCategoryIndex = 0;
  int selectedCategoryShopIndex = -1;
  String selectedCategoryShopTitle = '';

  final CreateCategoryUsecase createCategoryUsecase;
  final FetchAllCategoriesUsecase fetchAllCategoriesUsecase;
  final FetchCategoryUsecase fetchCategoryUsecase;
  final DeleteCategoryUsecase deleteCategoryUsecase;
  final UpdateCategoryUsecase updateCategoryUsecase;
  final FetchSettingsUsecase fetchSettingsUsecase;
  final UpdateSettingsUsecase updateSettingsUsecase;

  CategoriesBloc({required this.createCategoryUsecase,
    required this.fetchAllCategoriesUsecase,
    required this.fetchCategoryUsecase,
    required this.deleteCategoryUsecase,
    required this.updateCategoryUsecase,
    required this.fetchSettingsUsecase,
    required this.updateSettingsUsecase})
      : super(CategoriesState.initState());

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    yield* event.map(
        changeIsShop: _changeIsShop,
        fetchSettings: _fetchSettings,
        changeSelectedCategory: _changeSelectedCategory,
        changeSelectedCategoryShop: _changeSelectedCategoryShop,
        openCategory: _openCategory,
        resetCategoryStudy: _resetCategoryStudy,
        fetchCategories: _fetchCategories,
        addCategory: _addCategory,
        deleteCategory: _deleteCategory);
  }

  Stream<CategoriesState> _changeIsShop(ChangeIsShop event) async* {
    if(isShop != event.value){
      isShop = event.value;
      selectedCategoryShopIndex = -1;
      yield CategoriesState.initState();
    }
  }

  Stream<CategoriesState> _fetchSettings(FetchSettings event) async* {
    final errorOrSettings = await fetchSettingsUsecase();
    errorOrSettings.fold((error) => CategoriesState.error(error.message),
            (settings) => this.settings = settings);
  }

  Stream<CategoriesState> _changeSelectedCategory(
      ChangeSelectedCategory event) async* {
    settings.selectedCategory = event.title;
    selectedCategoryIndex = event.index;

    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error = errorOrSuccess.swap()
          .getOrElse(() => throw UnimplementedError());
      yield CategoriesState.error(error.message);
    }
  }

  Stream<CategoriesState> _changeSelectedCategoryShop(
      ChangeSelectedCategoryShop event) async* {
    selectedCategoryShopTitle = event.title;
    selectedCategoryShopIndex = event.index;
  }

  Stream<CategoriesState> _openCategory(OpenCategory event) async* {
    CategoriesState categoriesState = CategoriesState.initState();
    final errorOrCategory =
    await fetchCategoryUsecase(event.title);
    categoriesState = await errorOrCategory.fold(
            (error) => CategoriesState.error(error.message.toString()),
            (category) => _buyCategory(category, settings));
    yield categoriesState;
  }

  Stream<CategoriesState> _resetCategoryStudy(ResetCategoryStudy event) async* {
    final errorOrCategory =
    await fetchCategoryUsecase(settings.selectedCategory);
    yield await errorOrCategory.fold(
          (failure) => CategoriesState.error(failure.message),
          (category) => _updateCategory(category),
    );
  }


  Stream<CategoriesState> _fetchCategories(FetchCategories event) async* {
    final errorOrSuccess = await fetchAllCategoriesUsecase();
    yield errorOrSuccess.fold(
            (failure) => CategoriesState.error(failure.message),
            (allCategories) {
          final categories = isShop
              ? _getClosedCategories(allCategories)
              : _getOpenCategories(allCategories);
          final selectedIndex = isShop ? selectedCategoryShopIndex : selectedCategoryIndex;
          if (categories.isEmpty) {
            return CategoriesState.empty();
          } else {
            return CategoriesState.loaded(categories, selectedIndex);
          }
        }
    );
  }

  Stream<CategoriesState> _addCategory(AddCategory event) async* {
    final category = Category(
        title: event.title, openingCost: 0, isEditable: true, wordList: []);

    final errorOrSuccess = await createCategoryUsecase(category);
    if (errorOrSuccess.isLeft()) {
      final error = errorOrSuccess.swap()
          .getOrElse(() => throw UnimplementedError());
      yield CategoriesState.error(error.message);
    }
  }

  Stream<CategoriesState> _deleteCategory(DeleteCategory event) async* {
    final errorOrSuccess = await deleteCategoryUsecase(event.title);
    if (errorOrSuccess.isLeft()) {
      final error = errorOrSuccess.swap()
          .getOrElse(() => throw UnimplementedError());
      yield CategoriesState.error(error.message);
    }
    _resetSelectedCategory();
  }

  List<Category> _getOpenCategories(List<Category> allCategories) {
    return allCategories.where((category) => category.openingCost == 0)
        .toList();
  }

  List<Category> _getClosedCategories(List<Category> allCategories) {
    return allCategories.where((category) => category.openingCost != 0)
        .toList();
  }

  Future<CategoriesState> _buyCategory(Category category,
      Settings settings) async {
    if (category.openingCost > settings.starCount) {
      return CategoriesState.error('Not enough stars to open this category');
    }

    settings.starCount -= category.openingCost;
    category.openingCost = 0;

    final updatedCategoryErrorOrSuccess = await updateCategoryUsecase(category);
    final updatedSettingsErrorOrSuccess = await updateSettingsUsecase(settings);
    if (updatedCategoryErrorOrSuccess.isLeft() ||
        updatedSettingsErrorOrSuccess.isLeft()) {
      return CategoriesState.error('Something went wrong!');
    } else {
      return CategoriesState.initState();
    }
  }

  Future<CategoriesState> _updateCategory(Category category) async {
    final editedCategory = category.wordList
        .map((word) => word.status = WordStatus.unexplored)
        .toList() as Category;

    final errorOrSuccess = await updateCategoryUsecase(editedCategory);
    return errorOrSuccess.fold(
          (failure) => CategoriesState.error(failure.message),
          (success) => CategoriesState.initState(),
    );
  }

  Future<CategoriesState> _resetSelectedCategory() async {
    selectedCategoryIndex = 0;
    settings.selectedCategory = defaultCategory.title;
    final errorOrSuccess = await updateSettingsUsecase(settings);
    return errorOrSuccess.fold((error) => CategoriesState.error(error.message),
            (success) => CategoriesState.initState());
  }
}