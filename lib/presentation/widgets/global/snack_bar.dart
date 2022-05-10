import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

SnackBar snackBar(
    {required String title,
    Color? color,
    Color? textColor = const Color(AppColors.whiteDefault),
    SnackBarAction? action}) {
  return SnackBar(
    content: Text(title, style: TextStyle(color: textColor, fontSize: 12),),
    backgroundColor: color,
    duration: const Duration(seconds: 3),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    action: action,
  );
}
