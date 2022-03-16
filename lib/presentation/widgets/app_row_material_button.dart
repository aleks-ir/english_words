
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:word_study_puzzle/common/constants/app_colors.dart';


class AppRowMaterialButton extends StatelessWidget {
  final VoidCallback callback;
  final IconData? icon;
  final double iconSize;
  final double buttonSize;
  final Color iconColor;
  final Color buttonColor;

  const AppRowMaterialButton(
      {required this.callback,
      this.icon,
      this.iconSize = 20,
        this.buttonSize = 50,
      this.iconColor = const Color(AppColors.color2),
      this.buttonColor = const Color(AppColors.whiteDefault),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: buttonColor,
      elevation: 10,
      shape: CircleBorder(),
      constraints: BoxConstraints.tight(Size.square(buttonSize)),
      onPressed: callback,
      child: Transform.rotate(
        angle: 180 * pi / 180,
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
