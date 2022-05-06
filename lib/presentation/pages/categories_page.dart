import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_categories/categories_bloc.dart';
import 'package:word_study_puzzle/presentation/utils/flow_round_delegate.dart';
import 'package:word_study_puzzle/presentation/utils/hero_dialog_route.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_input_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/app_row_material_button.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';
import 'package:word_study_puzzle/presentation/widgets/categories/categories.dart';
import 'package:word_study_puzzle/presentation/widgets/snack_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  late CategoriesBloc _bloc;

  late AnimationController _flowAnimation;
  late AnimationController _listViewAnimation;
  late Animation<double> _listViewDouble;

  @override
  void initState() {
    super.initState();

    _flowAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _listViewAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    _listViewDouble =
        CurvedAnimation(parent: _listViewAnimation, curve: Curves.ease);

    _bloc = BlocProvider.of<CategoriesBloc>(context);
    _bloc.add(FetchSettings());
  }

  @override
  void dispose() {
    _flowAnimation.dispose();
    _listViewAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        floatingActionButton: _buildAddCategoryButton(),
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
            _runListViewAnimation();
            _resetFlowButton();
          },
          leftCallback: () {
            _bloc.add(ChangeIsShop(false));
            _bloc.add(FetchCategories());
            _runListViewAnimation();
            _resetFlowButton();
          },
          backgroundButtonColor: Theme.of(context).bottomAppBarColor,
        ),
        body: BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            state.maybeWhen(
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar(
                      title: message,
                      textColor: Theme.of(context).iconTheme.color));
                },
                success: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar(
                      title: message,
                      textColor: Theme.of(context).iconTheme.color));
                },
                orElse: () {});
          },
          child: Stack(
            children: [
              state.maybeWhen(initState: () {
                _bloc.add(FetchCategories());
                return Container();
              }, loaded: (categoryList, selectedIndex) {
                return FadeTransition(
                  opacity: _listViewDouble,
                  child: Stack(
                    children: [
                      CategoriesListView(
                        key: const Key(CategoriesPageKeys.listViewKey),
                        selectedIndex: selectedIndex,
                        categoryList: categoryList,
                        isShop: _bloc.isShop,
                        changeCategoryCallback: _changeCategory,
                        openCategoryCallback: _showOpenCategoryDialog,
                      ),
                      _bloc.isShop
                          ? _buildCounterShop()
                          : _buildFlowButton(categoryList[selectedIndex]),
                    ],
                  ),
                );
              }, orElse: () {
                return Container();
              }),
              _buildLabel(_bloc.isShop),
              _buildBackButton(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildFlowButton(Category category) {
    return Flow(
      delegate: FlowRoundDelegate(
        controller: _flowAnimation,
        paddingOffset: const Offset(20, 40),
      ),
      children: _createFlowItems(category),
    );
  }

  List<Widget> _createFlowItems(Category category) {
    List<Widget> items = [];

    items.add(AppRowAnimationMaterialButton(
      callback: _runAnimationFlowButton,
      animatedIcon: AnimatedIcons.menu_close,
      animationController: _flowAnimation,
      buttonSize: 40,
      iconSize: 18,
      buttonColor: Theme.of(context).floatingActionButtonTheme.backgroundColor!,
      iconColor: Theme.of(context).floatingActionButtonTheme.foregroundColor!,
    ));
    items.add(AppRowMaterialButton(
      elevation: 10,
      callback: () => _showDeleteOrResetDialog(category.isEditable),
      icon: category.isEditable ? Icons.delete : Icons.auto_delete,
      buttonSize: 40,
      iconSize: 15,
      buttonColor: Theme.of(context).floatingActionButtonTheme.backgroundColor!,
      iconColor: Theme.of(context).floatingActionButtonTheme.foregroundColor!,
    ));

    items.add(AppRowMaterialButton(
      elevation: 10,
      callback: () =>
          _showEditorDialog(category.title, category.description, category.iconAssetIndex),
      icon: Icons.edit,
      buttonSize: 40,
      iconSize: 15,
      buttonColor: Theme.of(context).floatingActionButtonTheme.backgroundColor!,
      iconColor: Theme.of(context).floatingActionButtonTheme.foregroundColor!,
    ));
    return items;
  }

  Widget _buildAddCategoryButton() {
    return AppExtendedFloatingActionButton(
      elevation: 5,
      callback: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return AppInputPopupCard(
            callback: _addCategory,
            heroTag: AppTags.heroAddTopic,
            title: 'New topic',
          );
        }));
      },
      title: 'Topic',
      icon: Icons.add,
      heroTag: AppTags.heroAddTopic,
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      left: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        icon: Icons.arrow_back_ios_sharp,
        heroTag: CategoriesPageKeys.backKey,
        callback: () {
          if (_bloc.selectedCategory != _bloc.settings.selectedCategory) {
            Navigator.pop(context, true);
          } else {
            Navigator.pop(context, false);
          }
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

  Widget _buildCounterShop() {
    return Positioned(
      top: 40,
      right: 20,
      child: ShopCounterWidget(
          title: _bloc.settings.day.toString(), icon: Icons.whatshot),
    );
  }

  void _runListViewAnimation() {
    _listViewAnimation.reset();
    _listViewAnimation.forward();
  }

  void _runAnimationFlowButton() {
    _flowAnimation.status == AnimationStatus.completed
        ? _flowAnimation.reverse()
        : _flowAnimation.forward();
  }

  void _hideFlowButton() {
    _flowAnimation.reverse();
  }

  void _resetFlowButton() {
    _flowAnimation.reset();
  }

  void _showDeleteOrResetDialog(bool isEditable) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CategoriesDialog(
            callback: _deleteOrResetCategory,
            title: isEditable ? 'Delete this topic?' : 'Reset studied words?',
          );
        });
  }

  void _showEditorDialog(String title, String description, int iconAssetIndex) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CategoriesEditorDialog(
            editCategoryCallback: (String description, int selectedIndex) {
              _bloc.add(EditCategory(title, description, selectedIndex));
              _bloc.add(FetchCategories());
            },
            description: description,
            iconAssetIndex: iconAssetIndex,
          );
        });
  }

  void _showOpenCategoryDialog(Category category) {
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return ShopPopupCard(
        callback: () => _openCategory(category.title),
        title: category.title,
        description: category.description,
        openingCost: category.openingCost,
        indexIconAsset: category.iconAssetIndex,
        heroTag: category.title,
      );
    }));
  }

  void _changeCategory(String title, int index) {
    _hideFlowButton();
    _bloc.add(ChangeSelectedCategory(title, index));
    _bloc.add(FetchCategories());
  }

  void _openCategory(String title) {
    _bloc.add(OpenCategory(title));
    _bloc.add(FetchCategories());
  }

  void _deleteOrResetCategory() {
    _bloc.add(DeleteOrResetCategory(_bloc.settings.selectedCategory));
    _bloc.add(FetchCategories());
  }

  void _addCategory(String title) {
    _bloc.add(AddCategory(title));
    _bloc.add(FetchCategories());
    if (_bloc.isShop) {
      _bloc.add(ChangeIsShop(false));
      _bloc.add(FetchCategories());
    }
  }
}
