import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_3000_puzzle/common/constants/app_pages.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_home/home_bloc.dart';

import '../navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          //final SettingsBloc _bloc = BlocProvider.of<SettingsBloc>(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
                child:
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(Navigation.route(context, AppPages.words));
                  },
                  child: Icon(Icons.login),
                )
            ),
          );
        },
      ),
    );
  }
}

