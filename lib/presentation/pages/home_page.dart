import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:word_study_puzzle/presentation/navigation.dart';

import 'package:word_study_puzzle/presentation/widgets/home/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _menuAnimation;

  @override
  void initState() {
    super.initState();
    _menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _menuAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
              appBar: HomeAppBar(
                controller: _menuAnimation,
                menuCallback: _runAnimationMenuButton,
                progressValue: 0.4,
                label: 'Day 1',
              ),
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [],
                    ),
                  ),
                  //_buildMenuButton(),
                ],
              ));
        },
      ),
    );
  }

  void _runAnimationMenuButton() {
    _menuAnimation.status == AnimationStatus.completed
        ? _menuAnimation.reverse()
        : _menuAnimation.forward();
    setState(() {});
  }
}
