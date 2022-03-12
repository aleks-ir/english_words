import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';

import 'package:word_study_puzzle/injection_container.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_categories/categories_bloc.dart';
import 'package:word_study_puzzle/presentation/utils/flow_vertical_delegate.dart';
import 'package:word_study_puzzle/presentation/widgets/app_dialog.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_row_material_button.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_field.dart';
import 'package:word_study_puzzle/presentation/widgets/categories/categories.dart';
import 'package:word_study_puzzle/presentation/widgets/snack_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  bool _isVisibleKeyboard = false;
  late CategoriesBloc _bloc;
  final double _flowButtonSize = 50;

  final _textFieldController = TextEditingController();
  final _textFieldFocusNode = FocusNode();

  late AnimationController _flowAnimation;
  late AnimationController _textFieldAnimation;
  late AnimationController _buttonConfirmAnimation;
  late Animation<Offset> _textFieldOffset;
  late Animation<Offset> _buttonConfirmOffset;

  void _onTextFieldChange() {
    if (_textFieldController.value.text.isNotEmpty) {
      _buttonConfirmAnimation.forward();
    } else {
      _buttonConfirmAnimation.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(_onTextFieldChange);
    _flowAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _textFieldAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _buttonConfirmAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _textFieldOffset =
        Tween<Offset>(begin: const Offset(0.0, -0.5), end: Offset.zero)
            .animate(_textFieldAnimation);
    _buttonConfirmOffset =
        Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero)
            .animate(_buttonConfirmAnimation);
  }

  @override
  void dispose() {
    _textFieldController.removeListener(_onTextFieldChange);
    _textFieldController.dispose();
    _textFieldFocusNode.dispose();
    _flowAnimation.dispose();
    _textFieldAnimation.dispose();
    _buttonConfirmAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _isVisibleKeyboard = (MediaQuery.of(context).viewInsets.bottom != 0.0);
    return BlocProvider<CategoriesBloc>(
        create: (context) => sl<CategoriesBloc>(),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
          _bloc = BlocProvider.of<CategoriesBloc>(context);
          return Scaffold(
            floatingActionButton: _selectFloatingActionButton(_bloc.isShop),
            floatingActionButtonLocation: _bloc.isShop
                ? FloatingActionButtonLocation.endDocked
                : FloatingActionButtonLocation.startDocked,
            bottomNavigationBar: CategoriesBottomAppBar(
                isShop: _bloc.isShop,
                shopCallback: () {
                  _closeFlowButton();
                  _hideTextFieldAndConfirmButton();
                  _bloc.add(ChangeIsShop(true));
                  _bloc.add(FetchCategories());
                },
                categoriesCallback: () {
                  _closeFlowButton();
                  _hideTextFieldAndConfirmButton();
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
                  _buildTextField(),
                  _bloc.isShop ? _buildStarCountShop() : Container(),
                  _buildConfirmButton(),
                  state.maybeWhen(initState: () {
                    _bloc.add(FetchSettings());
                    _bloc.add(FetchCategories());
                    return Container();
                  }, loaded: (categoryList, selectedIndex) {
                    final iconActionMap = _bloc.isShop
                        ? null
                        : _buildIconActionMap(
                            categoryList[selectedIndex].isEditable);
                    return Stack(
                      children: [
                        CategoriesListView(
                          key: const Key(CategoriesPageKeys.listViewKey),
                          selectedIndex: selectedIndex,
                          categoryList: categoryList,
                          isShop: _bloc.isShop,
                          callback: _changeCategory,
                        ),
                        if (iconActionMap != null)
                          _buildFlowButton(iconActionMap)
                      ],
                    );
                  }, orElse: () {
                    return Container();
                  }),
                ],
              ),
            ),
          );
        }));
  }

  Widget _selectFloatingActionButton(bool isShop) {
    if (isShop) {
      return AppFloatingActionButton(
        callback: () {
          _openCategory(_bloc.selectedCategoryShopTitle);
        },
        icon: Icons.thumb_up,
      );
    } else {
      return AppFloatingActionButton(
        callback: _runAnimationFlowButton,
        animationController: _flowAnimation,
        animatedIcon: AnimatedIcons.menu_close,
      );
    }
  }

  void _closeFlowButton() {
    _flowAnimation.reverse();
  }

  void _runAnimationFlowButton() {
    _flowAnimation.status == AnimationStatus.completed
        ? _flowAnimation.reverse()
        : _flowAnimation.forward();
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
        buttonColor: const Color(AppColors.whiteDefault),
        iconColor: const Color(AppColors.color2),
      ),
    );
  }

  Widget _buildLabel(bool isShop) {
    return Container(
        padding: const EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        child: AppTextBorder(
          title: isShop ? "New" : "Topics",
        ));
  }

  Widget _buildStarCountShop() {
    return Positioned(
      top: 40,
      right: 20,
      child: CategoriesStarCount(
        starCount: _bloc.settings.starCount,
      ),
    );
  }

  Widget _buildTextField() {
    return SlideTransition(
      position: _textFieldOffset,
      child: Container(
        padding: const EdgeInsets.only(right: 90, top: 40, left: 90),
        alignment: Alignment.topCenter,
        child: AppTextField(
          key: const Key(CategoriesPageKeys.textFieldKey),
          callback: () {
            _addCategory();
            _hideTextFieldAndConfirmButton();
          },
          controller: _textFieldController,
          focusNode: _textFieldFocusNode,
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return SlideTransition(
      position: _buttonConfirmOffset,
      child: Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.only(right: 20, top: 40),
        child: AppSmallFloatingActionButton(
          icon: Icons.check,
          heroTag: CategoriesPageKeys.confirmKey,
          callback: () {
            _addCategory();
            _hideTextFieldAndConfirmButton();
          },
        ),
      ),
    );
  }

  Widget _buildFlowButton(Map<IconData, Function()> iconActionMap) {
    return Flow(
      key: const Key(CategoriesPageKeys.flowKey),
      delegate: FlowVerticalDelegate(
          controller: _flowAnimation,
          buttonSize: _flowButtonSize,
          isVisibleKeyboard: _isVisibleKeyboard),
      children: iconActionMap.entries
          .map((e) => AppRowMaterialButton(
                callback: () {
                  e.value();
                  _runAnimationFlowButton();
                },
                buttonSize: _flowButtonSize,
                icon: e.key,
              ))
          .toList(),
    );
  }

  Map<IconData, VoidCallback> _buildIconActionMap(bool isEditable) {
    final Map<IconData, VoidCallback> iconActionMap = {};
    if (isEditable) {
      iconActionMap[Icons.delete] = _showDeleteDialog;
    }
    iconActionMap[Icons.restart_alt] = _showResetDialog;
    iconActionMap[Icons.add] = _showTextField;
    return iconActionMap;
  }

  void _showDeleteDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialog(
            title: 'Do you want to delete \nthis topic?',
            callback: _deleteCategory,
          );
        });
  }

  void _showResetDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialog(
            title: 'Do you want to reset \nstudied words?',
            callback: _cleanProgress,
          );
        });
  }

  void _showTextField() {
    _textFieldFocusNode.requestFocus();
    _textFieldAnimation.forward();
  }

  void _hideTextFieldAndConfirmButton() {
    _buttonConfirmAnimation.reverse();
    _textFieldAnimation.reverse();
    _textFieldController.text = "";
    _textFieldFocusNode.unfocus();
  }

  void _cleanProgress() {
    _bloc.add(ResetStudiedWords(_bloc.settings.selectedCategory));
    _bloc.add(FetchCategories());
  }

  void _changeCategory(String title, int index) {
    _closeFlowButton();
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

  void _addCategory() {
    _bloc.add(AddCategory(_textFieldController.value.text));
    _bloc.add(FetchCategories());
    _textFieldController.clear();
    _textFieldFocusNode.unfocus();
  }
}
