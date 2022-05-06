import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppMaterialButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final Color? textColor;
  final Color? backgroundColor;

  const AppMaterialButton(
      {required this.callback,
        this.title = '',
        this.backgroundColor,
        this.textColor,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: callback,
      textColor: const Color(AppColors.whiteDefault),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(title),
      ),
      height: 40,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
