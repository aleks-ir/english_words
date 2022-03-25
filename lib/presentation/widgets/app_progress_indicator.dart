import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppProgressIndicator extends StatelessWidget {
  final Color color;

  const AppProgressIndicator({
    this.color = const Color(AppColors.color7),
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 5,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}


Widget defaultCircularProgressIndicator(Color color) =>
    CircularProgressIndicator(
      strokeWidth: 5,
      valueColor: AlwaysStoppedAnimation<Color>(color.withOpacity(0.5)),
    );