import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_3000_puzzle/common/constants/app_pages.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:words_3000_puzzle/presentation/pages/home_page.dart';
import 'package:words_3000_puzzle/presentation/pages/settings_page.dart';
import 'package:words_3000_puzzle/presentation/pages/words_page.dart';

import 'bloc/bloc_settings/settings_bloc.dart';
import 'bloc/bloc_words/words_bloc.dart';


class Navigation extends StatelessWidget {
  const Navigation({
    Key? key,
    required this.blocContext,
    required this.page,
  }) : super(key: key);

  final BuildContext blocContext;
  final String page;

  static MaterialPageRoute<void> route(BuildContext context, String page) => MaterialPageRoute(
    builder: (_) => Navigation(blocContext: context, page: page),
  );

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case AppPages.words:
        return BlocProvider<WordsBloc>(
          create: (_) => BlocProvider.of<WordsBloc>(blocContext),
          child: const WordsPage(),
        );
      case AppPages.settings:
        return BlocProvider<SettingsBloc>(
          create: (_) => BlocProvider.of<SettingsBloc>(blocContext),
          child: const SettingsPage(),
        );
      default:
        return BlocProvider<HomeBloc>(
          create: (_) => BlocProvider.of<HomeBloc>(blocContext),
          child: const HomePage(),
        );
    }
  }
}