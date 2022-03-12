import 'package:flutter/material.dart';

import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  final VoidCallback callback;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  const AppTextField(
      {required this.callback,
      this.controller,
      this.focusNode,
      this.borderColor = const Color(AppColors.color3),
      this.backgroundColor = const Color(AppColors.whiteDefault),
      this.textColor = const Color(AppColors.color2),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        onEditingComplete: callback,
        cursorColor: borderColor,
        focusNode: focusNode,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
          fontFamily: "Verdana",
        ),
        controller: controller,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: borderColor),
          ),
        ));
  }
}
