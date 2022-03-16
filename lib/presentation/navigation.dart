import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_calendar/calendar_bloc.dart';
import 'package:word_study_puzzle/presentation/pages/calendar_page.dart';
import 'package:word_study_puzzle/presentation/pages/categories_page.dart';
import 'package:word_study_puzzle/presentation/pages/home_page.dart';
import 'package:word_study_puzzle/presentation/pages/settings_page.dart';
import 'package:word_study_puzzle/presentation/pages/words_page.dart';

import '../common/constants/app_pages.dart';
import 'bloc/bloc_categories/categories_bloc.dart';
import 'bloc/bloc_home/home_bloc.dart';
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
      case AppPages.home:
        return BlocProvider<HomeBloc>(
          create: (_) => BlocProvider.of<HomeBloc>(blocContext),
          child: const HomePage(),
        );
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
      case AppPages.categories:
        return BlocProvider<CategoriesBloc>(
          create: (_) => BlocProvider.of<CategoriesBloc>(blocContext),
          child: const CategoriesPage(),
        );
      case AppPages.calendar:
        return BlocProvider<CalendarBloc>(
          create: (_) => BlocProvider.of<CalendarBloc>(blocContext),
          child: const CalendarPage(),
        );

      default:
        return BlocProvider<HomeBloc>(
          create: (_) => BlocProvider.of<HomeBloc>(blocContext),
          child: const HomePage(),
        );
    }
  }
}