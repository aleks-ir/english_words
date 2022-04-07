import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/injection_container.dart';
import 'package:word_study_puzzle/presentation/pages/categories_page.dart';
import 'package:word_study_puzzle/presentation/pages/home_page.dart';
import 'package:word_study_puzzle/presentation/pages/settings_page.dart';
import 'package:word_study_puzzle/presentation/pages/stats_page.dart';
import 'package:word_study_puzzle/presentation/pages/words_page.dart';

import 'bloc/bloc_categories/categories_bloc.dart';
import 'bloc/bloc_home/home_bloc.dart';
import 'bloc/bloc_settings/settings_bloc.dart';
import 'bloc/bloc_stats/stats_bloc.dart';
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
          create: (_) => sl<WordsBloc>(),
          child: const WordsPage(),
        );
      case AppPages.settings:
        return BlocProvider<SettingsBloc>(
          create: (_) =>  sl<SettingsBloc>(),
          child: const SettingsPage(),
        );
      case AppPages.categories:
        return BlocProvider<CategoriesBloc>(
          create: (_) =>  sl<CategoriesBloc>(),
          child: const CategoriesPage(),
        );
      case AppPages.calendar:
        return BlocProvider<StatsBloc>(
          create: (_) =>  sl<StatsBloc>(),
          child: const StatsPage(),
        );
      default:
        return BlocProvider<HomeBloc>(
          create: (_) =>  sl<HomeBloc>(),
          child: const HomePage(),
        );
    }
  }
}