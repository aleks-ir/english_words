import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Color color;

  const AppCircularProgressIndicator({
    this.color = AppColors.green300,
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
    this.color = AppColors.green700,
    this.backgroundColor = AppColors.grey300,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          //backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

