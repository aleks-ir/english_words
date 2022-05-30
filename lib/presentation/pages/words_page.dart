import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_keys.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_titles.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_words/words_bloc.dart';
import 'package:word_study_puzzle/presentation/pages/word_details_page.dart';
import 'package:word_study_puzzle/presentation/utils/flow_vertical_delegate.dart';
import 'package:word_study_puzzle/presentation/utils/hero_dialog_route.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';
import 'package:word_study_puzzle/presentation/widgets/global/global.dart';
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
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..forward();
    _gridViewDouble =
        CurvedAnimation(parent: _gridViewAnimation, curve: Curves.ease);

    _bloc = BlocProvider.of<WordsBloc>(context);
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
              return BlocListener<WordsBloc, WordsState>(
                listener: (context, state) {
                  state.maybeWhen(
                      error: (message) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar(title: message,
                            textColor: Theme.of(context).iconTheme.color));
                      },
                      success: (message) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar(title: message,
                            textColor: Theme.of(context).iconTheme.color));
                      },
                      orElse: () {});
                },
                child: state.maybeWhen(initState: () {
                  _bloc.add(InitMod());
                  _bloc.add(BuildPreviewImagesUrl());
                  _bloc.add(FetchAllWords());
                  return Container();
                }, changedType: () {
                  _bloc.add(BuildPreviewImagesUrl());
                  _bloc.add(FetchAllWords());
                  return Container();
                }, switchedView: () {
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
                      previewImagesUrl: _bloc.previewImagesUrl,
                      countSelectedItems: countSelectedItems,
                      isListView: _bloc.isListView,
                      pressCallback: (word, currentIndexImageUrl) {
                        if (countSelectedItems == 0) {
                          Navigator.of(context).push(WordDetailsPage.route(
                              context, word.title, currentIndexImageUrl));
                        } else {
                          activeMultipleChoice(word, currentIndexImageUrl);
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
                  return Container();
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
            iconSize: 18,
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
          if(_bloc.isAddOrRemoveWord){
            Navigator.pop(context, true);
          }else{
            Navigator.pop(context);
          }
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
          buttonColor: AppColors.green800,
          iconColor: AppColors.whiteDefault,
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
          child: TextBorder(
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
        callback: switchView,
      ),
    );
  }

  void switchView() {
    _runGridViewAnimation();
    _runAnimationListView();
    _bloc.add(SwitchView());
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
    _buttonActionAnimation.reset();
  }


  void _runAnimationFlowButton() {
    _flowAnimation.status == AnimationStatus.completed
        ? _flowAnimation.reverse()
        : _flowAnimation.forward();
  }

  void _hideFlowButton() {
    _flowAnimation.reverse();
  }

  Widget _buildFlowButton() {
    return BlocBuilder<WordsBloc, WordsState>(builder: (context, state) {
      final bloc = BlocProvider.of<WordsBloc>(context);
      return Flow(
        delegate: FlowVerticalDelegate(
          controller: _flowAnimation,
          buttonSize: _flowButtonSize,
        ),
        children: _createFlowItems(bloc),
      );
    });
  }

  List<Widget> _createFlowItems(WordsBloc bloc) {
    List<Widget> items = [];

    items.add(RawAnimationMaterialButton(
      callback: _runAnimationFlowButton,
      animatedIcon: AnimatedIcons.menu_close,
      animationController: _flowAnimation,
    ));
    items.add(AppRawMaterialButton(
      callback: () {
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.unexploredWordsKey));
      },
      isSelected: bloc.typeWords == WordsPageKeys.unexploredWordsKey,
      icon: Icons.data_saver_off,
      type: WordsPageKeys.unexploredWordsKey,
    ));
    items.add(AppRawMaterialButton(
      callback: () {
        _runGridViewAnimation();
        _buttonActionAnimation.value = 0;
        bloc.add(ChangeType(WordsPageKeys.exploringWordsKey));
      },
      isSelected: bloc.typeWords == WordsPageKeys.exploringWordsKey,
      icon: Icons.explore_outlined,
      type: WordsPageKeys.exploringWordsKey,
    ));
    items.add(AppRawMaterialButton(
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
    _hideFlowButton();
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppInputPopupCard(
        callback: _addWord,
        title: AppTitles.newWord,
        heroTag: AppTags.heroAddWord,
      );
    }));
  }

  void _showSearchDialog() {
    _hideFlowButton();
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppInputPopupCard(
        callback: _searchWord,
        title: AppTitles.wordSearch,
        buttonTitle: AppTitles.search,
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
      return AppPopupCard(
        callback: _deleteWords,
        title: AppTitles.deleteWords,
        heroTag: AppTags.heroDeleteWords,
      );
    }));
  }

  void _showAddInExploreDialog() {
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppPopupCard(
        callback: _addInExplore,
        title: AppTitles.studyWords,
        heroTag: AppTags.heroAddInExplore,
      );
    }));
  }

  void _showRemoveFromExploreDialog() {
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return AppPopupCard(
        callback: _removeFromExplore,
        title: AppTitles.removeWords,
        heroTag: AppTags.heroRemoveFromExplore,
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
    _bloc.add(ClearSelectedItems());
  }

  void _addInExplore() {
    _runGridViewAnimation();
    _hideActionButton();
    _bloc.add(AddWordsInExplore());
    _bloc.add(ClearSelectedItems());
  }

  VoidCallback _selectActionCallback(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return _showAddWordDialog;
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return _addInExplore;
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return _removeFromExplore;
    } else {
      return _showDeleteWordsDialog;
    }
  }
}
