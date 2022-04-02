import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Color color;

  const AppCircularProgressIndicator({
    this.color = const Color(AppColors.color7),
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 3,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}


class AppLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final Color backgroundColor;


  const AppLinearProgressIndicator({
    required this.value,
    this.color = const Color(AppColors.color3),
    this.backgroundColor = const Color(AppColors.greyLight),
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

