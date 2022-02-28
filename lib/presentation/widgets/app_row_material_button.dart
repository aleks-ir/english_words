
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';


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
      this.iconColor = const Color(AppColors.whiteDefault),
      this.buttonColor = const Color(AppColors.lightGreen700),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: buttonColor,
      shape: const CircleBorder(),
      constraints: BoxConstraints.tight(Size.square(buttonSize)),
      onPressed: callback,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
