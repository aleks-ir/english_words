import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_keys.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/calendar.dart';

class Selectors {
  static String selectActionTitle(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return 'Word';
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return 'Study';
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return 'Remove';
    } else {
      return 'Delete';
    }
  }

  static IconData selectActionIcon(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return Icons.add;
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return Icons.explore;
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return Icons.explore_off;
    } else {
      return Icons.delete;
    }
  }

  static String selectActionTag(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return AppTags.heroAddWord;
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return AppTags.heroAddInExplore;
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return AppTags.heroRemoveFromExplore;
    } else {
      return AppTags.heroDeleteWords;
    }
  }

  static String selectTitle(String type) {
    if (type == WordsPageKeys.exploringWordsKey) {
      return 'Studying';
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return 'Unstudied';
    } else {
      return 'Words';
    }
  }

  static String selectCellText(int index, int indexOfFirstDayMonth, int day) {
    if (index < daysOfWeek.length) {
      return daysOfWeek[index];
    } else if (index < indexOfFirstDayMonth) {
      return '';
    } else {
      return '$day';
    }
  }

  static Color selectIconColor(bool awardWasReceived) {
    return awardWasReceived
        ? const Color(AppColors.yellow700)
        : const Color(AppColors.grey500);
  }

  static TextStyle selectCellTextStyle(
      int index, double correctAnswerRate, bool isCurrentDate) {
    if (isCurrentDate) {
      return const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(AppColors.green600));
    }
    if (index < daysOfWeek.length) {
      return const TextStyle(
          fontSize: 8, fontWeight: FontWeight.w600, fontFamily: 'Verdana');
    } else {
      return const TextStyle(
          fontSize: 13,);
    }
  }

  static Color selectExploredColor(double rate) {
    if (rate == 0) {
      return Colors.transparent;
    } else if (rate <= 0.2) {
      return const Color(AppColors.green400);
    } else if (rate >= 0.2 && rate <= 0.4) {
      return const Color(AppColors.green500);
    } else if (rate >= 0.4 && rate <= 0.6) {
      return const Color(AppColors.green600);
    } else if (rate >= 0.6 && rate <= 0.8) {
      return const Color(AppColors.green700);
    } else {
      return const Color(AppColors.green800);
    }
  }

  static ThemeData selectTheme(bool darkThemeIsEnabled) {
    if (darkThemeIsEnabled) {
      return ThemeData(
        brightness: Brightness.dark,
        textTheme: ThemeData.dark().textTheme,
        primaryColor: const Color(AppColors.green900),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: ThemeData.dark().bottomAppBarColor,),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Color(AppColors.whiteDefault),
          backgroundColor: Color(AppColors.grey800),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(AppColors.green800)),
          ),
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              pickerTextStyle: TextStyle(
                  color: Color(AppColors.whiteDefault), fontSize: 17)),
        ),
        hoverColor: Colors.grey.shade700,
        indicatorColor: Colors.grey.shade600,
      );
    } else {
      return ThemeData(
        brightness: Brightness.light,
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: const Color(AppColors.green900),
              displayColor: const Color(AppColors.green900),
            ),
        primaryColor: const Color(AppColors.green800),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: ThemeData.light().bottomAppBarColor,),
        iconTheme: const IconThemeData(color: Color(AppColors.green800)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Color(AppColors.green800),
          backgroundColor: Color(AppColors.whiteDefault),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          linearTrackColor: Color(AppColors.grey300),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(AppColors.green800)),
          ),
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              pickerTextStyle:
                  TextStyle(color: Color(AppColors.green900), fontSize: 17)),
        ),
        hoverColor: Colors.grey.shade200,
        indicatorColor: Colors.grey.shade100,
      );
    }
  }
}
