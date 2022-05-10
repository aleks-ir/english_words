import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_study_puzzle/common/constants/initial_categories.dart';
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
  String selectedCategory = '';


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
        openCategory: _openCategory,
        fetchCategories: _fetchCategories,
        addCategory: _addCategory,
        deleteOrResetCategory: _deleteOrResetCategory,
        editCategory: _editCategory);
  }

  Stream<CategoriesState> _changeIsShop(ChangeIsShop event) async* {
    if (isShop != event.value) {
      isShop = event.value;
    }
  }

  Stream<CategoriesState> _fetchSettings(FetchSettings event) async* {
    final errorOrSettings = await fetchSettingsUsecase();
    errorOrSettings.fold(
        (error) => print(error.message),
        (settings) => _saveData(settings));
  }

  void _saveData(Settings settings){
    this.settings = settings;
    selectedCategory = settings.selectedCategory;
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


  Stream<CategoriesState> _openCategory(OpenCategory event) async* {
    final errorOrCategory = await fetchCategoryUsecase(event.title);

    if (errorOrCategory.isRight()) {
      final category =
          errorOrCategory.getOrElse(() => throw UnimplementedError());
      yield await _buyCategory(category, settings);
    }
  }

  Stream<CategoriesState> _fetchCategories(FetchCategories event) async* {
    final errorOrAllCategories = await fetchAllCategoriesUsecase();
    yield errorOrAllCategories.fold((error) => CategoriesState.error(error.message),
        (allCategories) {
      final categories = isShop
          ? _getClosedCategories(allCategories)
          : _getOpenCategories(allCategories);
      final selectedIndex = _searchSelectedIndex(categories, settings.selectedCategory);
      if (categories.isEmpty) {
        return CategoriesState.empty();
      } else {
        return CategoriesState.loaded(categories, selectedIndex);
      }
    });
  }

  int _searchSelectedIndex(List<Category> categories, String title) {
    return categories
        .indexWhere((element) => element.title == title);
  }

  Stream<CategoriesState> _addCategory(AddCategory event) async* {
    final category = Category(
        title: event.title);

    final errorOrSuccess = await createCategoryUsecase(category);
    if (errorOrSuccess.isLeft()) {
      final error =
          errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      yield CategoriesState.error(error.message);
    }
  }

  Stream<CategoriesState> _deleteOrResetCategory(DeleteOrResetCategory event) async* {
    final errorOrAllCategories = await fetchAllCategoriesUsecase();
    if(errorOrAllCategories.isRight()){
      final allCategories = errorOrAllCategories.getOrElse(() => []);
      final category = allCategories.firstWhere((category) => category.title == event.title);
      if(category.isEditable){
        yield await _deleteCategory(category.title);
      }else{
        yield await _resetExploredCategory(category);
      }
    }
  }

  Future<CategoriesState> _deleteCategory(String title) async{
    _setDefaultCategory();
    final errorOrSuccess = await deleteCategoryUsecase(title);
    return errorOrSuccess.fold(
          (error) => CategoriesState.error(error.message),
          (success) =>
          CategoriesState.success('The topic successfully deleted'),
    );
  }

  Future<CategoriesState> _resetExploredCategory(Category category) async{
    final List<Word> words = [];
    for(var word in category.wordList){
      word.status = WordStatus.unexplored;
      words.add(word);
    }
    category.wordList = words;
    return await _updateCategory(category, 'The words studied were successfully reset');
  }


  Stream<CategoriesState> _editCategory(EditCategory event) async* {
    final errorOrAllCategories = await fetchAllCategoriesUsecase();
    if(errorOrAllCategories.isRight()){
      final allCategories = errorOrAllCategories.getOrElse(() => []);
      final category = allCategories.firstWhere((category) => category.title == event.title);
      if(category.description != event.description || category.iconAssetIndex != event.indexIconAsset){
        category.description = event.description;
        category.iconAssetIndex = event.indexIconAsset;
        yield await _updateCategory(category, 'Topic was successfully changed');
      }

    }

  }



  void _setDefaultCategory() async {
    settings.selectedCategory = Initial.defaultCategory;
    final errorOrSuccess = await updateSettingsUsecase(settings);
    if (errorOrSuccess.isLeft()) {
      final error =
          errorOrSuccess.swap().getOrElse(() => throw UnimplementedError());
      print(error.message);
    }
  }

  List<Category> _getOpenCategories(List<Category> allCategories) {
    return allCategories
        .where((category) => category.openingCost == 0)
        .toList();
  }

  List<Category> _getClosedCategories(List<Category> allCategories) {
    return allCategories
        .where((category) => category.openingCost != 0)
        .toList();
  }

  Future<CategoriesState> _buyCategory(
      Category category, Settings settings) async {
    if (category.openingCost > settings.flameCount) {
      return CategoriesState.error(
          'It\'s not possible right now, try later');
    }
    settings.flameCount -= category.openingCost;
    category.openingCost = 0;

    final updatedCategoryErrorOrSuccess = await updateCategoryUsecase(category);
    final updatedSettingsErrorOrSuccess = await updateSettingsUsecase(settings);
    if (updatedCategoryErrorOrSuccess.isLeft() ||
        updatedSettingsErrorOrSuccess.isLeft()) {
      return CategoriesState.error('Something went wrong try again');
    } else {
      return CategoriesState.success('The topic successfully opened');
    }
  }

  Future<CategoriesState> _updateCategory(Category category, String successMassage) async {
    final errorOrSuccess = await updateCategoryUsecase(category);
    return errorOrSuccess.fold(
      (error) => CategoriesState.error(error.message),
      (success) =>
          CategoriesState.success(successMassage),
    );
  }
}
