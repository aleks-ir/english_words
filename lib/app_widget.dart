import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:word_study_puzzle/presentation/pages/spalsh_page.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';
import 'package:word_study_puzzle/presentation/utils/theme_switcher.dart';

import 'common/constants/box_names.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({required this.theme, Key? key}) : super(key: key);

  final ThemeSwitcher theme;

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.box(BoxNames.categories).compact();
    Hive.box(BoxNames.history).compact();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.theme.darkThemeIsEnabled,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const MaterialApp(home: SplashPage(false));
          } else {
            return MaterialApp(
                theme: Selectors.selectTheme(snapshot.data as bool),
                home: const SplashPage(true));
          }
        });
  }
}
