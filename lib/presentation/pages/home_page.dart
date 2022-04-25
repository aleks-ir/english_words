import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/injection_container.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:word_study_puzzle/presentation/widgets/app_progress_indicator.dart';
import 'package:word_study_puzzle/presentation/widgets/app_splash.dart';
import 'package:word_study_puzzle/presentation/widgets/home/home_app_bar.dart';
import 'package:word_study_puzzle/presentation/widgets/home/home_flip_card.dart';
import 'package:word_study_puzzle/presentation/widgets/home/home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          _bloc = BlocProvider.of<HomeBloc>(context);
          return Scaffold(
              appBar: HomeAppBar(
                bloc: _bloc,
                textColor: Theme.of(context).iconTheme.color,
              ),
              body: state.maybeWhen(initState: () {
                _bloc.add(InitUnexploredWords());
                _bloc.add(InitSettings());
                _bloc.add(InitHistory());
                return Container();
              }, content: (words) {
                return HomePageView(
                  pageController: _bloc.pageController,
                  pageCallback: (int page) {
                    _bloc.add(ChangeCardPage(page));
                  },
                  selectLetterCallback: _selectLetter,
                  unselectLetterCallback: _unselectLetter,
                  openWordCallback: _openCard,
                  resetWordCallback: _resetWord,
                  words: words,
                  imageUrlMap: _bloc.imageUrlMap,
                );
              }, empty: () {
                return Container();
              }, orElse: () {
                return Container();
              }));
        },
      ),
    );
  }

  void _selectLetter(Word word, int letterId) {
    _bloc.add(SelectLetter(word, letterId));
    setState(() {});
  }

  void _unselectLetter(Word word, int letterId) {
    _bloc.add(UnselectLetter(word, letterId));
    setState(() {});
  }

  void _openCard(Word word) {
    _bloc.add(StudyWord(word));
    setState(() {});
  }

  void _resetWord(Word word) {
    _bloc.add(ResetWord(word));
    setState(() {});
  }
}
