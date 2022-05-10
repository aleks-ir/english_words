import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:word_study_puzzle/presentation/navigation.dart';
import 'package:word_study_puzzle/presentation/widgets/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late HomeBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: HomeAppBar(
                textColor: Theme.of(context).iconTheme.color,
                navigateTo: _navigateTo,
                ),
            body: state.maybeWhen(initState: () {
              _bloc.add(InitSettings());
              _bloc.add(InitHistory());
              _bloc.add(InitUnexploredWords());
              return Container();
            }, content: (words) {
              return HomePageView(
                pageController: _bloc.pageController,
                pageCallback: (int page) {
                  _bloc.add(ChangeCardPage(page));
                },
                isCarouselMode: _bloc.settings.viewCarouselIsEnabled,
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

  void _navigateTo(String page) => () {
    Navigator.of(context)
        .push(Navigation.route(context, page))
        .then(_checkIntentToUpdate);
  };

  void _checkIntentToUpdate(value) {
    if (value != null) {
      if (value) {
        _bloc.add(InitUnexploredWords());
      } else {
        _bloc.add(InitSettings());
        _bloc.add(UpdateScreen());
      }
    }
  }
}
