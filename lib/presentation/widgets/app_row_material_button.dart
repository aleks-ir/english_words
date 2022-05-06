import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppRowMaterialButton extends StatelessWidget {
  final VoidCallback callback;
  final IconData icon;
  final String? type;
  final bool isSelected;
  final double iconSize;
  final double buttonSize;
  final double elevation;
  final Color iconColor;
  final Color buttonColor;
  final Color selectedColor;

  const AppRowMaterialButton(
      {required this.callback,
      required this.icon,
      this.type,
      this.isSelected = false,
      this.iconSize = 20,
      this.buttonSize = 46,
        this.elevation = 5,
      this.iconColor = const Color(AppColors.whiteDefault),
      this.buttonColor = const Color(AppColors.green800),
        this.selectedColor = const Color(AppColors.limeAccent100),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: isSelected ? buttonColor : buttonColor,
      elevation: elevation,
      shape: CircleBorder(),
      constraints: BoxConstraints.tight(Size.square(buttonSize)),
      onPressed: callback,
      child: Transform.rotate(
        angle: pi,
        child: Icon(
          icon,
          color: isSelected ? selectedColor : iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

class AppRowAnimationMaterialButton extends StatelessWidget {
  final VoidCallback callback;
  final AnimationController animationController;
  final AnimatedIconData animatedIcon;
  final double iconSize;
  final double buttonSize;
  final Color iconColor;
  final Color buttonColor;

  const AppRowAnimationMaterialButton(
      {required this.callback,
      required this.animationController,
      required this.animatedIcon,
      this.iconSize = 20,
      this.buttonSize = 46,
      this.iconColor = const Color(AppColors.whiteDefault),
      this.buttonColor = const Color(AppColors.green800),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: buttonColor,
        elevation: 5,
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size.square(buttonSize)),
        onPressed: callback,
        child: AnimatedIcon(
          icon: animatedIcon,
          progress: animationController,
          color: iconColor,
          size: iconSize,
        ));
  }
}
