import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

SnackBar snackBar(
    {required String title,
    Color? color,
    Color? textColor = const Color(AppColors.whiteDefault),
    SnackBarAction? action}) {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: textColor),),
      ],
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    elevation: 10,
    behavior: SnackBarBehavior.fixed,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    action: action,
  );
}
