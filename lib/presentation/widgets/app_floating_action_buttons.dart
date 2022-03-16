import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  final VoidCallback callback;
  final AnimationController? animationController;
  final IconData? icon;
  final AnimatedIconData? animatedIcon;
  final double? iconSize;
  final Color? iconColor;
  final Color? buttonColor;

  const AppFloatingActionButton(
      {required this.callback,
      this.animationController,
      this.icon,
      this.animatedIcon,
      this.iconSize,
      this.iconColor,
      this.buttonColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: callback,
      backgroundColor: buttonColor,
      child: animationController != null && animatedIcon != null
          ? AnimatedIcon(
              icon: animatedIcon!,
              progress: animationController!,
              color: iconColor,
              size: iconSize,
            )
          : Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
    );
  }
}


class AppSmallFloatingActionButton extends StatelessWidget {
  final VoidCallback callback;
  final String? heroTag;
  final AnimationController? animationController;
  final IconData? icon;
  final AnimatedIconData? animatedIcon;
  final double? iconSize;
  final Color? iconColor;
  final Color? buttonColor;

  const AppSmallFloatingActionButton(
      {required this.callback,
        this.heroTag,
        this.animationController,
        this.icon,
        this.animatedIcon,
        this.iconSize = 17,
        this.iconColor,
        this.buttonColor,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: heroTag,
      onPressed: callback,
      elevation: 4,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: buttonColor,
      child: animationController != null && animatedIcon != null
          ? AnimatedIcon(
        icon: animatedIcon!,
        progress: animationController!,
        color: iconColor,
        size: iconSize,
      )
          : Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}

