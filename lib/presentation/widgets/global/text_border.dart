import 'package:flutter/cupertino.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';

class TextBorder extends StatelessWidget {
  final String title;
  final double fontSize;
  final double strokeWidth;
  final double letterSpacing;
  final Color internalColor;
  final Color externalColor;

  const TextBorder({required this.title,
    this.fontSize = 20,
    this.strokeWidth = 4,
    this.letterSpacing = 4,
    this.internalColor = AppColors.whiteDefault,
    this.externalColor = AppColors.green700,
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
            fontFamily: AppFonts.pamega,
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
            fontFamily: AppFonts.pamega,
            letterSpacing: letterSpacing,
            fontWeight: FontWeight.bold,
            color: internalColor,
          ),
        ),
      ],
    );
  }
}