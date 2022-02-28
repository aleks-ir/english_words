import 'package:flutter/cupertino.dart';

import '../../common/constants/app_colors.dart';

class AppTextBorder extends StatelessWidget {
  final String title;
  final double fontSize;
  final double strokeWidth;
  final double letterSpacing;
  final Color internalColor;
  final Color externalColor;

  const AppTextBorder({required this.title,
    this.fontSize = 25,
    this.strokeWidth = 6,
    this.letterSpacing = 5,
    this.internalColor = const Color(AppColors.whiteDefault),
    this.externalColor = const Color(AppColors.lightGreen700),
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = externalColor,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: FontWeight.bold,
            color: internalColor,
          ),
        ),
      ],
    );
  }
}