import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';

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
      this.borderColor = const Color(AppColors.lightGreen700),
      this.backgroundColor = const Color(AppColors.whiteDefault),
      this.textColor = const Color(AppColors.lightGreen700),
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
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
        controller: controller,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 2, color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: borderColor),
          ),
        ));
  }
}
