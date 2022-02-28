import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_3000_puzzle/common/constants/app_colors.dart';
import '../../injection_container.dart';
import '../bloc/bloc_categories/categories_bloc.dart';

import '../widgets/app_floating_action_buttons.dart';
import '../widgets/app_row_material_button.dart';
import '../widgets/app_text_border.dart';
import '../widgets/app_text_field.dart';

import '../widgets/categories/categories.dart';
import '../widgets/flow_vertical_delegate.dart';
import '../widgets/snack_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  bool _isVisibleKeyboard = false;
  late CategoriesBloc _bloc;
  final double _flowButtonSize = 46;

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
  Widget build(BuildContext context) {
    _isVisibleKeyboard = (MediaQuery.of(context).viewInsets.bottom != 0.0);
    return BlocProvider<CategoriesBloc>(
        create: (context) => sl<CategoriesBloc>(),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
          _bloc = BlocProvider.of<CategoriesBloc>(context);
          return Scaffold(
            floatingActionButton: _selectFloatingActionButton(_bloc.isShop),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: CategoriesBottomAppBar(
                bloc: _bloc,
                callback: () {
                  _closeFlowButton();
                  _hideTextFieldAndConfirmButton();
                }),
            body: BlocListener<CategoriesBloc, CategoriesState>(
              listener: (context, state) {
                state.maybeWhen(
                    error: (message) {
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
                  state.when(initState: () {
                    _bloc.add(FetchSettings());
                    _bloc.add(FetchCategories());
                    return Container();
                  }, loading: () {
                    return const Center(child: CircularProgressIndicator());
                  }, loaded: (categoryList, selectedIndex) {
                    final iconActionMap = _bloc.isShop
                        ? null
                        : _buildIconActionMap(
                            categoryList[selectedIndex].isEditable);
                    return Stack(
                      children: [
                        CategoriesListView(
                          selectedIndex: selectedIndex,
                          categoryList: categoryList,
                          isShop: _bloc.isShop,
                          callback: _changeCategory,
                        ),
                        if (iconActionMap != null)
                          _buildFlowButton(iconActionMap),
                      ],
                    );
                  }, empty: () {
                    return Container();
                  }, error: (message) {
                    return Container();
                  })
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
        icon: Icons.shopping_cart,
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
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 20, top: 40),
      child: AppSmallFloatingActionButton(
        icon: Icons.arrow_back_ios_sharp,
        heroTag: "btn_back",
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
          title: isShop ? "Store" : "Topic",
        ));
  }

  Widget _buildStarCountShop() {
    return Positioned(
      top: 43,
      right: 20,
      child: CategoriesStarCount(starCount: _bloc.settings.starCount,),
    );
  }

  Widget _buildTextField() {
    return SlideTransition(
      position: _textFieldOffset,
      child: Container(
        padding: const EdgeInsets.only(right: 90, top: 40, left: 90),
        alignment: Alignment.topCenter,
        child: AppTextField(
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
          heroTag: "btn_confirm",
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
      iconActionMap[Icons.delete] = _deleteCategory;
    }
    iconActionMap[Icons.restore] = _cleanProgress;
    iconActionMap[Icons.add] = _showTextField;
    return iconActionMap;
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
    _bloc.add(ResetCategoryStudy(_bloc.settings.selectedCategory));
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

  void _addCategory() {
    _bloc.add(AddCategory(_textFieldController.value.text));
    _bloc.add(FetchCategories());
    _textFieldController.clear();
    _textFieldFocusNode.unfocus();
  }
}
