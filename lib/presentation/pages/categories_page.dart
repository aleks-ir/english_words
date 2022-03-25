import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_categories/categories_bloc.dart';
import 'package:word_study_puzzle/presentation/utils/hero_dialog_route.dart';
import 'package:word_study_puzzle/presentation/widgets/app_dialog.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';
import 'package:word_study_puzzle/presentation/widgets/categories/categories.dart';
import 'package:word_study_puzzle/presentation/widgets/categories/categories_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/snack_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  late CategoriesBloc _bloc;

  late AnimationController _buttonActionAnimation;

  @override
  void initState() {
    super.initState();
    _buttonActionAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    _buttonActionAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_isVisibleKeyboard = (MediaQuery.of(context).viewInsets.bottom != 0.0);
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
      _bloc = BlocProvider.of<CategoriesBloc>(context);
      return Scaffold(
        extendBody: true,
        floatingActionButton: _selectCenterActionButton(_bloc.isShop),
        floatingActionButtonLocation: _bloc.isShop
            ? FloatingActionButtonLocation.centerDocked
            : FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CategoriesBottomAppBar(
            status: _bloc.isShop
                ? CategoriesPageKeys.rightButtonKey
                : CategoriesPageKeys.leftButtonKey,
            rightCallback: () {
              _bloc.add(ChangeIsShop(true));
              _bloc.add(FetchCategories());
            },
            leftCallback: () {
              _bloc.add(ChangeIsShop(false));
              _bloc.add(FetchCategories());
            }),
        body: BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            state.maybeWhen(
                error: (message) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar(title: message));
                },
                success: (message) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar(title: message));
                },
                orElse: () {});
          },
          child: Stack(
            children: [
              _buildBackButton(),
              _buildLabel(_bloc.isShop),
              _bloc.isShop ? _buildPuzzleCountShop() : Container(),
              state.maybeWhen(initState: () {
                _bloc.add(FetchSettings());
                _bloc.add(FetchCategories());
                return Container();
              }, loaded: (categoryList, selectedIndex) {
                // final iconActionMap = _bloc.isShop
                //     ? null
                //     : _buildIconActionMap(
                //         categoryList[selectedIndex].isEditable);
                final isEditableCategory = selectedIndex != -1
                    ? categoryList[selectedIndex].isEditable
                    : false;
                return Stack(
                  children: [
                    CategoriesListView(
                      key: const Key(CategoriesPageKeys.listViewKey),
                      selectedIndex: selectedIndex,
                      categoryList: categoryList,
                      isShop: _bloc.isShop,
                      callback: _changeCategory,
                    ),
                    !_bloc.isShop ? _buildActionButton(isEditableCategory) : Container(),
                  ],
                );
              }, orElse: () {
                return Container();
              }),
            ],
          ),
        ),
      );
    });
  }


  Widget _buildActionButton(bool isEditable) {
    return Positioned(
      top: 40,
      right: 20,
      child:
      AppSmallFloatingActionButton(
        callback: isEditable ? _showDeleteDialog : _showResetDialog,
        icon: isEditable ? Icons.delete : Icons.refresh,
      ),
    );
  }

  Widget _selectCenterActionButton(bool isShop) {
    if (isShop) {
      return AppExtendedFloatingActionButton(
        callback: () {
          _openCategory(_bloc.selectedCategoryShopTitle);
        },
        title: 'Open',
        indent: 10,
        icon: Icons.thumb_up,
      );
    } else {
      return AppExtendedFloatingActionButton(
        callback: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return CategoriesPopupCard(
              callback: _addCategory,
            );
          }));
        },
        title: 'Topic',
        iconSize: 23,
        icon: Icons.add,
        heroTag: AppTags.heroAddTopic,
      );
    }
  }

  Widget _buildBackButton() {
    return Positioned(
      left: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        icon: Icons.arrow_back_ios_sharp,
        heroTag: CategoriesPageKeys.backKey,
        callback: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildLabel(bool isShop) {
    return Container(
        padding: const EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        child: AppTextBorder(
          title: isShop ? "Store" : "Topics",
        ));
  }

  Widget _buildPuzzleCountShop() {
    return Positioned(
      top: 40,
      right: 20,
      child: CategoriesStarCount(
        title: _bloc.settings.starCount.toString(),
        icon: Icons.extension,
      ),
    );
  }


  void _showDeleteDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialog(
            callback: _deleteCategory,
            question: 'Do you want to delete \nthis topic?',
          );
        });
  }

  void _showResetDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialog(
            callback: _cleanProgress,
            question: 'Do you want to reset \nstudied words?',
          );
        });
  }

  void _cleanProgress() {
    _bloc.add(ResetStudiedWords(_bloc.settings.selectedCategory));
    _bloc.add(FetchCategories());
  }

  void _changeCategory(String title, int index) {
    if (_bloc.isShop) {
      _bloc.add(ChangeSelectedCategoryShop(title, index));
    } else {
      _bloc.add(ChangeSelectedCategory(title, index));
    }
    _bloc.add(FetchCategories());
  }

  void _openCategory(String title) {
    _bloc.add(OpenCategory(title));
    _bloc.add(FetchCategories());
  }

  void _deleteCategory() {
    _bloc.add(DeleteCategory(_bloc.settings.selectedCategory));
    _bloc.add(FetchCategories());
  }

  void _addCategory(String title) {
    _bloc.add(AddCategory(title));
    _bloc.add(FetchCategories());
  }
}
