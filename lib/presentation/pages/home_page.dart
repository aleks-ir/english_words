import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/injection_container.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:word_study_puzzle/presentation/widgets/home/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

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
          return Scaffold(
              appBar: HomeAppBar(
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

}
