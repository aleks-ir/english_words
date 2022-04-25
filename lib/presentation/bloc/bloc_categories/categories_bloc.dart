import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_study_puzzle/common/constants/default.dart';
import 'package:word_study_puzzle/common/constants/word_status.dart';
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/domain/usecases/categories/categories.dart';
import 'package:word_study_puzzle/domain/usecases/settings/settings.dart';

part 'categories_bloc.freezed.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  late Settings settings;
  bool isShop = false;
  String oldSelectedCategory = '';
  int categoryShopIndex = -1;
  String selectedCategoryShopTitle = '';

  final CreateCategoryUsecase createCategoryUsecase;
  final FetchAllCategoriesUsecase fetchAllCategoriesUsecase;
  final FetchCategoryUsecase fetchCategoryUsecase;
  final DeleteCategoryUsecase deleteCategoryUsecase;
  final UpdateCategoryUsecase updateCategoryUsecase;
  final FetchSettingsUsecase fetchSettingsUsecase;
  final UpdateSettingsUsecase updateSettingsUsecase;

  CategoriesBloc(
      {required this.createCategoryUsecase,
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
        openSelectedCategory: _openSelectedCategory,
        resetStudiedWords: _resetStudiedWords,
        fetchCategories: _fetchCategories,
        addCategory: _addCategory,
        deleteCategory: _deleteCategory);
  }

  Stream<CategoriesState> _changeIsShop(ChangeIsShop event) async* {
    if (isShop != event.value) {
      isShop = event.value;
      categoryShopIndex = -1;
      selectedCategoryShopTitle = '';
    }
  }

  Stream<CategoriesState> _fetchSettings(FetchSettings event) async* {
    final errorOrSettings = await fetchSettingsUsecase();
    errorOrSettings.fold(
        (error) => print(error.message),
        (settings) => _saveBlocData(settings));
  }

  void _saveBlocData(Settings settings){
    this.settings = settings;
    oldSelectedCategory = settings.selectedCategory;
  }

  Stream<CategoriesState> _changeSelectedCategory(
      ChangeSelectedCategory event) async* {
    settings.selectedCategory = event.title;

    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error =
          errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield CategoriesState.error(error.message);
    }
  }

  Stream<CategoriesState> _changeSelectedCategoryShop(
      ChangeSelectedCategoryShop event) async* {
    selectedCategoryShopTitle = event.title;
    categoryShopIndex = event.index;
  }

  Stream<CategoriesState> _openSelectedCategory(OpenSelectedCategory event) async* {
    final errorOrCategory = await fetchCategoryUsecase(selectedCategoryShopTitle);

    if (errorOrCategory.isRight()) {
      final category =
          errorOrCategory.getOrElse(() => throw UnimplementedError());
      yield await _buyCategory(category, settings);
    }
  }

  Stream<CategoriesState> _resetStudiedWords(ResetStudiedWords event) async* {
    final errorOrCategory =
        await fetchCategoryUsecase(settings.selectedCategory);
    yield await errorOrCategory.fold(
      (failure) => CategoriesState.error(failure.message),
      (category) => _updateCategory(category),
    );
  }

  Stream<CategoriesState> _fetchCategories(FetchCategories event) async* {
    final errorOrSuccess = await fetchAllCategoriesUsecase();
    yield errorOrSuccess.fold((error) => CategoriesState.error(error.message),
        (allCategories) {
      final categories = isShop
          ? _getClosedCategories(allCategories)
          : _getOpenCategories(allCategories);
      final selectedIndex =
          isShop ? categoryShopIndex : _getCategoryIndex(categories);
      if (categories.isEmpty) {
        return CategoriesState.empty();
      } else {
        return CategoriesState.loaded(categories, selectedIndex);
      }
    });
  }

  int _getCategoryIndex(List<Category> categories) {
    return categories
        .indexWhere((element) => element.title == settings.selectedCategory);
  }

  Stream<CategoriesState> _addCategory(AddCategory event) async* {
    final category = Category(
        title: event.title, openingDay: 0, isEditable: true, wordList: []);

    final errorOrSuccess = await createCategoryUsecase(category);
    if (errorOrSuccess.isLeft()) {
      final error =
          errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield CategoriesState.error(error.message);
    }
  }

  Stream<CategoriesState> _deleteCategory(DeleteCategory event) async* {
    final errorOrSuccess = await deleteCategoryUsecase(event.title);
    yield errorOrSuccess.fold(
      (error) => CategoriesState.error(error.message),
      (success) =>
          CategoriesState.success('The topic successfully delete'),
    );
    _resetCategory();
  }

  void _resetCategory() async {
    settings.selectedCategory = defaultCategory.title;
    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error =
          errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      print(error.message);
    }
  }

  List<Category> _getOpenCategories(List<Category> allCategories) {
    return allCategories
        .where((category) => category.openingDay == 0)
        .toList();
  }

  List<Category> _getClosedCategories(List<Category> allCategories) {
    return allCategories
        .where((category) => category.openingDay != 0)
        .toList();
  }

  Future<CategoriesState> _buyCategory(
      Category category, Settings settings) async {
    if (category.openingDay > settings.day) {
      return CategoriesState.error(
          'Not enough puzzles to open this topic');
    }

    categoryShopIndex = -1;
    selectedCategoryShopTitle = '';
    settings.day -= category.openingDay;
    category.openingDay = 0;

    final updatedCategoryErrorOrSuccess = await updateCategoryUsecase(category);
    final updatedSettingsErrorOrSuccess = await updateSettingsUsecase(settings);
    if (updatedCategoryErrorOrSuccess.isLeft() ||
        updatedSettingsErrorOrSuccess.isLeft()) {
      return CategoriesState.error('Something went wrong try again');
    } else {
      return CategoriesState.success('The topic successfully open');
    }
  }

  Future<CategoriesState> _updateCategory(Category category) async {
    category.wordList = category.wordList
        .map((word) => (word.status = WordStatus.unexplored) as Word)
        .toList();

    final errorOrSuccess = await updateCategoryUsecase(category);
    return errorOrSuccess.fold(
      (error) => CategoriesState.error(error.message),
      (success) =>
          CategoriesState.success('The topic successfully reset'),
    );
  }
}
