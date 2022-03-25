import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

SnackBar snackBar(
    {required String title,
    double marginBottom = 20,
    Color color = const Color(AppColors.whiteDefault),
    Color textColor = const Color(AppColors.color1),
    SnackBarAction? action}) {
  return SnackBar(
    content: Text(title, style: TextStyle(color: textColor),),
    backgroundColor: color,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(left: 20, right: 20, bottom: marginBottom),
    action: action,
  );
}
