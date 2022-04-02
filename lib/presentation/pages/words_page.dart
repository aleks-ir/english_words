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
  final double _flowButtonSize = 48;
  final _scrollController = ScrollController();

  late WordsBloc _bloc;

  late AnimationController _flowAnimation;

  late AnimationController _buttonActionAnimation;
  late Animation<Offset> _buttonActionOffset;

  late AnimationController _listViewAnimation;

  late AnimationController _gridViewAnimation;
  late Animation<double> _gridViewDouble;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onVerticalScroll);
    _flowAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _buttonActionAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _buttonActionOffset =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, -0.45))
            .animate(_buttonActionAnimation);

    _listViewAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _gridViewAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..forward();
    _gridViewDouble =
        CurvedAnimation(parent: _gridViewAnimation, curve: Curves.ease);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onVerticalScroll);
    _scrollController.dispose();
    _flowAnimation.dispose();
    _listViewAnimation.dispose();
    _buttonActionAnimation.dispose();
    _gridViewAnimation.dispose();

    super.dispose();
  }

  void _onVerticalScroll() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      _closeFlowButton();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar(title: message));
                      },
                      success: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar(title: message));
                      },
                      orElse: () {});
                },
                child: state.maybeWhen(initState: () {
                  _bloc.add(InitMod());
                  _bloc.add(FetchAllWords());
                  return Container();
                }, changedType: () {
                  _bloc.add(FetchAllWords());
                  return Container();
                }, loaded: (wordList, countSelectedItems) {
                  if (_bloc.isEditableMod &&
                      _bloc.typeWords == WordsPageKeys.allWordsKey) {
                    _showActionButton();
                  }
                  return FadeTransition(
                    opacity: _gridViewDouble,
                    child: WordsGridView(
                      words: wordList,
                      controller: _scrollController,
                      selectedItems: _bloc.selectedItems,
                      countSelectedItems: countSelectedItems,
                      isListView: _bloc.isListView,
                      pressCallback: (Word word, int? indexUrl) {
                        if (countSelectedItems == 0) {
                          Navigator.of(context).push(WordDetailsPage.route(
                              context, word.title, indexUrl));
                        } else {
                          activeMultipleChoice(word, indexUrl);
                        }
                      },
                      doublePressCallback: (Word word, int? indexUrl) {
                        if (_bloc.isEditableMod) {
                          activeMultipleChoice(word, indexUrl);
                        }
                      },
                    ),
                  );
                }, empty: () {
                  if (_bloc.isEditableMod &&
                      _bloc.typeWords == WordsPageKeys.allWordsKey) {
                    _showActionButton();
                  }
                  return const Center(
                      child: Text(
                    "There's nothing here",
                    style: TextStyle(
                        color: Color(AppColors.color2),
                        fontFamily: 'Verdana'),
                  ));
                }, orElse: () {
                  return Container();
                }),
              );
            },
          ),
          _buildLabel(),
          _buildFlowButton(),
          _buildSearchButton(),
          _buildBackButton(),
          _buildListViewButton(),
          _buildActionButton(),
        ],
      ),
    );
  }

  void activeMultipleChoice(Word word, int? indexUrl) {
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
  }

  Widget _buildActionButton() {
    return BlocBuilder<WordsBloc, WordsState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<WordsBloc>(context);
        final type = bloc.selectedItems.isEmpty && bloc.isEditableMod
            ? WordsPageKeys.addWordKey
            : bloc.typeWords;
        return SlideTransition(
          position: _buttonActionOffset,
          child: AppExtendedFloatingActionButton(
            callback: _selectActionCallback(type),
            title: Selectors.selectActionTitle(type),
            iconSize: 15,
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

  Widget _buildSearchButton() {
    return Positioned(
      right: 20,
      bottom: 20,
      child: SizedBox(
        width: 46,
        height: 46,
        child: AppSmallFloatingActionButton(
          icon: Icons.search,
          heroTag: AppTags.heroSearchWord,
          callback: _showSearchDialog,
          buttonColor: const Color(AppColors.color2),
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
            title: Selectors.selectTitle(bloc.typeWords),
          ));
    });
  }

  Widget _buildListViewButton() {
    return Positioned(
      top: 40,
      right: 20,
      child: AppSmallAnimationFloatingActionButton(
        animationController: _listViewAnimation,
        animatedIcon: AnimatedIcons.view_list,
        callback: switchListView,
      ),
    );
  }

  void switchListView(){
    _bloc.add(SwitchListView());
    _runAnimationListView();
  }

  void _runAnimationListView() {
    if (_listViewAnimation.status == AnimationStatus.completed) {
      _listViewAnimation.reverse();
    } else {
      _listViewAnimation.forward();
    }
  }

  void _closeFlowButton() {
    _flowAnimation.reverse();
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
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.unexploredWordsKey));
      },
      isSelected: bloc.typeWords == WordsPageKeys.unexploredWordsKey,
      icon: Icons.data_saver_off,
      type: WordsPageKeys.unexploredWordsKey,
    ));
    items.add(AppRowMaterialButton(
      callback: () {
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.exploringWordsKey));
      },
      isSelected: bloc.typeWords == WordsPageKeys.exploringWordsKey,
      icon: Icons.explore_outlined,
      type: WordsPageKeys.exploringWordsKey,
    ));
    items.add(AppRowMaterialButton(
      callback: () {
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.allWordsKey));
      },
      isSelected: bloc.typeWords == WordsPageKeys.allWordsKey,
      icon: Icons.home,
      type: WordsPageKeys.allWordsKey,
    ));
    return items;
  }

  void _showAddWordDialog() {
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppInputPopupCard(
        callback: _addWord,
        mainTitle: 'New word',
        heroTag: AppTags.heroAddWord,
      );
    }));
  }

  void _showSearchDialog() {
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppInputPopupCard(
        callback: _searchWord,
        mainTitle: 'Word search',
        buttonTitle: "Search",
        heroTag: AppTags.heroSearchWord,
      );
    }));
  }

  void _searchWord(String keyword) {
    _bloc.add(ChangeKeyword(keyword));
    _bloc.add(FetchAllWords());
  }

  void _showDeleteWordsDialog() {
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppDialogPopupCard(
        callback: _deleteWords,
        title: 'Delete selected words?',
        heroTag: AppTags.heroDeleteWords,
      );
    }));
  }

  void _showAddInExploreDialog() {
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppDialogPopupCard(
        callback: _addInExplore,
        title: 'Study selected words?',
        heroTag: AppTags.heroDeleteWords,
      );
    }));
  }

  void _showRemoveFromExploreDialog() {
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
    _hideActionButton();
    _bloc.add(DeleteWords());
    _bloc.add(FetchAllWords());
  }

  void _removeFromExplore() {
    _runGridViewAnimation();
    _hideActionButton();
    _bloc.add(RemoveWordsFromExplore());
    _bloc.add(FetchAllWords());
  }

  void _addInExplore() {
    _runGridViewAnimation();
    _hideActionButton();
    _bloc.add(AddWordsInExplore());
    _bloc.add(FetchAllWords());
  }

  VoidCallback _selectActionCallback(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return _showAddWordDialog;
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return _showAddInExploreDialog;
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return _showRemoveFromExploreDialog;
    } else {
      return _showDeleteWordsDialog;
    }
  }
}
