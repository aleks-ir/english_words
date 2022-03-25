import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_words/words_bloc.dart';
import 'package:word_study_puzzle/presentation/pages/word_details_page.dart';
import 'package:word_study_puzzle/presentation/utils/flow_vertical_delegate.dart';
import 'package:word_study_puzzle/presentation/utils/hero_dialog_route.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';
import 'package:word_study_puzzle/presentation/widgets/app_dialog_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_input_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/app_row_material_button.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_field.dart';
import 'package:word_study_puzzle/presentation/widgets/snack_bar.dart';
import 'package:word_study_puzzle/presentation/widgets/words/words_grid_view.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({Key? key}) : super(key: key);

  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> with TickerProviderStateMixin {
  final double _flowButtonSize = 50;
  final _textFieldController = TextEditingController();
  final _textFieldFocusNode = FocusNode();
  final _scrollController = ScrollController();

  late WordsBloc _bloc;

  late AnimationController _flowAnimation;

  late AnimationController _buttonActionAnimation;
  late Animation<Offset> _buttonActionOffset;

  late AnimationController _textFieldAnimation;
  late Animation<double> _textFieldDouble;

  late AnimationController _gridViewAnimation;
  late Animation<double> _gridViewDouble;

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(_onTextFieldChange);
    _textFieldFocusNode.addListener(_onTextFieldTap);
    _scrollController.addListener(_onVerticalScroll);
    _flowAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _buttonActionAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _buttonActionOffset =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, -0.6))
            .animate(_buttonActionAnimation);

    _textFieldAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _textFieldDouble =
        CurvedAnimation(parent: _textFieldAnimation, curve: Curves.easeIn);

    _gridViewAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..forward();
    _gridViewDouble =
        CurvedAnimation(parent: _gridViewAnimation, curve: Curves.ease);

  }

  @override
  void dispose() {
    _textFieldFocusNode.removeListener(_onTextFieldTap);
    _textFieldController.removeListener(_onTextFieldChange);
    _textFieldController.removeListener(_onVerticalScroll);
    _textFieldController.dispose();
    _textFieldFocusNode.dispose();
    _flowAnimation.dispose();
    _textFieldAnimation.dispose();
    _buttonActionAnimation.dispose();
    _gridViewAnimation.dispose();

    super.dispose();
  }

  void _onTextFieldTap() {
    if (_bloc.selectedItems.isNotEmpty) {
      _runGridViewAnimation();
      _bloc.add(ClearSelectedItems());
    }
    if (_textFieldFocusNode.hasFocus) {
      _closeFlowButton();
      _textFieldAnimation.forward();
    }
  }

  void _onTextFieldChange() {
    final keyword = _textFieldController.value.text;
    _bloc.add(FetchWordsByKeyword(keyword));
  }

  void _onVerticalScroll() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      _closeFlowButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<WordsBloc, WordsState>(
            builder: (context, state) {
              _bloc = BlocProvider.of<WordsBloc>(context);
              return BlocListener<WordsBloc, WordsState>(
                listener: (context, state) {
                  state.maybeWhen(
                      error: (message) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                            snackBar(title: message, marginBottom: 100));
                      },
                      success: (message) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar(title: message,  marginBottom: 100));
                      },
                      orElse: () {});
                },
                child: state.maybeWhen(initState: () {
                  _bloc.add(FetchAllWords());
                  return Container();
                }, loaded: (wordList, countSelectedItems) {
                  return FadeTransition(
                    opacity: _gridViewDouble,
                    child: WordsGridView(
                      words: wordList,
                      controller: _scrollController,
                      selectedItems: _bloc.selectedItems,
                      countSelectedItems: countSelectedItems,
                      allowEdits: _textFieldController.text.isEmpty,
                        isPortrait: isPortrait,
                      pressCallback: (String title, int? indexUrl) {
                        if (countSelectedItems == 0) {
                          Navigator.of(context).push(
                              WordDetailsPage.route(context, title, indexUrl));
                        }
                      },
                      doublePressCallback: (Word word, int? indexUrl) {
                        if (_bloc.selectedItems.containsKey(word)) {
                          _bloc.add(RemoveSelectedItem(word));
                          _bloc.add(FetchAllWords());
                          if (_bloc.selectedItems.length == 1) {
                            _hideActionButton();
                          }
                        } else {
                          _bloc.add(AddSelectedItem(word, indexUrl));
                          _bloc.add(FetchAllWords());
                          if (_bloc.selectedItems.isEmpty) {
                            _showActionButton();
                          }
                        }
                      },
                    ),
                  );
                }, orElse: () {
                  return Container();
                }),
              );
            },
          ),
          _buildActionButton(),
          _buildLabel(),
          _buildFlowButton(),
          _buildAddButton(),
          _buildBackButton(),
          _buildSearchButton(),
          _buildTextField(),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return BlocBuilder<WordsBloc, WordsState>(
      builder: (context, state) {
        final type = BlocProvider.of<WordsBloc>(context).typeWordList;
        return SlideTransition(
          position: _buttonActionOffset,
          child: AppExtendedFloatingActionButton(
            callback: _selectActionCallback(type),
            title: Selectors.selectActionTitle(type),
            iconSize: 23,
            icon: Selectors.selectActionIcon(type),
            heroTag: Selectors.selectActionTag(type),
          ),
        );
      },
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      left: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        icon: Icons.arrow_back_ios_sharp,
        heroTag: WordsPageKeys.backKey,
        callback: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildAddButton() {
    return Positioned(
      right: 20,
      bottom: 30,
      child: SizedBox(
        width: 50,
        height: 50,
        child: AppFloatingActionButton(
          icon: Icons.add,
          heroTag: AppTags.heroAddWord,
          callback: _showAddWordDialog,
          buttonColor: const Color(AppColors.color3),
          iconColor: const Color(AppColors.whiteDefault),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return BlocBuilder<WordsBloc, WordsState>(builder: (context, state) {
      final bloc = BlocProvider.of<WordsBloc>(context);
      return Container(
          padding: const EdgeInsets.only(top: 50),
          alignment: Alignment.topCenter,
          child: AppTextBorder(
            title: Selectors.selectTitle(bloc.typeWordList),
          ));
    });
  }


  Widget _buildSearchButton() {
    return Positioned(
      top: 40,
      right: 20,
      child: AppSmallAnimationFloatingActionButton(
        animationController: _textFieldAnimation,
        animatedIcon: AnimatedIcons.search_ellipsis,
        callback: _runAnimationTextField,
      ),
    );
  }

  Widget _buildTextField() {
    return FadeTransition(
      opacity: _textFieldDouble,
      child: Container(
        padding: const EdgeInsets.only(right: 100, top: 40, left: 100),
        alignment: Alignment.topCenter,
        child: AppTextField(
          callback: () {},
          controller: _textFieldController,
          focusNode: _textFieldFocusNode,
          borderColor: const Color(AppColors.color3),
        ),
      ),
    );
  }

  void _runAnimationTextField() {
    if (_textFieldAnimation.status == AnimationStatus.completed) {
      _textFieldAnimation.reverse();
      _textFieldFocusNode.unfocus();
      _textFieldController.text = "";
    } else {
      _textFieldAnimation.forward();
    }
  }

  void _closeFlowButton() {
    _flowAnimation.reverse();
  }

  void _closeTextField() {
    _textFieldAnimation.reverse();
    _textFieldFocusNode.unfocus();
    _textFieldController.text = "";
  }

  void _showActionButton() {
    _buttonActionAnimation.forward();
  }

  void _runGridViewAnimation() {
    _gridViewAnimation.reset();
    _gridViewAnimation.forward();
  }

  void _hideActionButton() {
    _buttonActionAnimation.reverse();
  }

  void _runAnimationFlowButton() {
    _flowAnimation.status == AnimationStatus.completed
        ? _flowAnimation.reverse()
        : _flowAnimation.forward();
  }

  Widget _buildFlowButton() {
    return BlocBuilder<WordsBloc, WordsState>(builder: (context, state) {
      final bloc = BlocProvider.of<WordsBloc>(context);
      return Flow(
        delegate: FlowVerticalDelegate(
          controller: _flowAnimation,
          buttonSize: _flowButtonSize,
        ),
        children: _flowItems(bloc),
      );
    });
  }

  List<Widget> _flowItems(WordsBloc bloc) {
    List<Widget> items = [];

    items.add(AppRowAnimationMaterialButton(
      callback: _runAnimationFlowButton,
      animatedIcon: AnimatedIcons.menu_close,
      animationController: _flowAnimation,
    ));
    items.add(AppRowMaterialButton(
      callback: () {
        _closeTextField();
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.unexploredWordsKey));
      },
      isSelected: bloc.typeWordList == WordsPageKeys.unexploredWordsKey,
      icon: Icons.data_saver_off,
      type: WordsPageKeys.unexploredWordsKey,
    ));
    items.add(AppRowMaterialButton(
      callback: () {
        _closeTextField();
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.exploringWordsKey));
      },
      isSelected: bloc.typeWordList == WordsPageKeys.exploringWordsKey,
      icon: Icons.explore_outlined,
      type: WordsPageKeys.exploringWordsKey,
    ));
    items.add(AppRowMaterialButton(
      callback: () {
        _closeTextField();
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.allWordsKey));
      },
      isSelected: bloc.typeWordList == WordsPageKeys.allWordsKey,
      icon: Icons.home,
      type: WordsPageKeys.allWordsKey,
    ));
    return items;
  }

  void _showAddWordDialog(){
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppInputPopupCard(
        callback: _addWord,
        title: 'Enter a word',
        heroTag: AppTags.heroAddWord,
      );
    }));
  }

  void _showDeleteWordsDialog(){
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppDialogPopupCard(
        callback: _deleteWords,
        title: 'Do you want to delete selected words?',
        heroTag: AppTags.heroDeleteWords,
      );
    }));
  }

  void _showAddInExploreDialog(){
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppDialogPopupCard(
        callback: _addInExplore,
        title: 'Do you want to study selected words?',
        heroTag: AppTags.heroDeleteWords,
      );
    }));
  }

  void _showRemoveFromExploreDialog(){
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppDialogPopupCard(
        callback: _removeFromExplore,
        title: 'Do you want to remove from study selected words?',
        heroTag: AppTags.heroDeleteWords,
      );
    }));
  }


  void _addWord(String title) {
    _bloc.add(AddWord(title));
    _bloc.add(FetchAllWords());
  }

  void _deleteWords() {
    _runGridViewAnimation();
    _bloc.add(DeleteWords());
  }

  void _removeFromExplore() {
    _runGridViewAnimation();
    _bloc.add(RemoveWordsFromExplore());
  }

  void _addInExplore() {
    _runGridViewAnimation();
    _bloc.add(AddWordsInExplore());
  }

  VoidCallback _selectActionCallback(String type){
    if(type == WordsPageKeys.unexploredWordsKey){
      return _showAddInExploreDialog;
    }else if(type == WordsPageKeys.exploringWordsKey){
      return _showRemoveFromExploreDialog;
    }else{
      return _showDeleteWordsDialog;
    }
  }

}
