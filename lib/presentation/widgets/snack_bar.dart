import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

SnackBar snackBar(
    {required String title,
    Color color = const Color(AppColors.whiteDefault),
    Color textColor = const Color(AppColors.color1),
    SnackBarAction? action}) {
  return SnackBar(
    content: Text(title, style: TextStyle(color: textColor),),
    backgroundColor: color,
    elevation: 10,
    behavior: SnackBarBehavior.fixed,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
    action: action,
  );
}
