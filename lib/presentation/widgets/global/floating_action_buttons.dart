import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  final VoidCallback callback;
  final IconData? icon;
  final String? heroTag;
  final double? elevation;
  final double? iconSize;
  final Color? iconColor;
  final Color? buttonColor;

  const AppFloatingActionButton(
      {required this.callback,
      this.icon,
      this.heroTag,
      this.elevation = 10,
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
      heroTag: heroTag,
      elevation: elevation,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}

class AppExtendedFloatingActionButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final String? heroTag;
  final double? elevation;
  final IconData? icon;
  final double indent;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;

  const AppExtendedFloatingActionButton(
      {required this.callback,
      this.title = '',
      this.heroTag,
        this.elevation = 10,
      this.icon,
      this.indent = 5.0,
      this.iconSize = 20,
      this.iconColor = const Color(AppColors.whiteDefault),
      this.buttonColor = const Color(AppColors.green800),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        elevation: elevation,
        onPressed: callback,
        backgroundColor: buttonColor,
        heroTag: heroTag,
        label: Row(
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(
              width: title.isNotEmpty ? indent : 0,
            ),
            Text(
              title,
              style: TextStyle(color: iconColor),
            ),
          ],
        ));
  }
}

class AppSmallFloatingActionButton extends StatelessWidget {
  final VoidCallback callback;
  final String? heroTag;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? buttonColor;

  const AppSmallFloatingActionButton(
      {required this.callback,
      this.heroTag,
      this.icon,
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
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}

class AppSmallAnimationFloatingActionButton extends StatelessWidget {
  final VoidCallback callback;
  final String? heroTag;
  final AnimationController? animationController;
  final AnimatedIconData? animatedIcon;
  final double? iconSize;
  final Color? iconColor;
  final Color? buttonColor;

  const AppSmallAnimationFloatingActionButton(
      {required this.callback,
      this.heroTag,
      this.animationController,
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
        child: AnimatedIcon(
          icon: animatedIcon!,
          progress: animationController!,
          color: iconColor,
          size: iconSize,
        ));
  }
}
