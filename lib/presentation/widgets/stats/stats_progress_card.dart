import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';
import 'package:word_study_puzzle/presentation/widgets/app_progress_indicator.dart';

class StatsProgressCard extends StatelessWidget {
  const StatsProgressCard({required this.dayExploredRate, this.color, Key? key})
      : super(key: key);

  final double dayExploredRate;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 40,
        width: 54,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.plus_one,
                  color: Color(AppColors.grey500),
                  size: 11,
                ),
                Icon(
                  Icons.whatshot,
                  color: Color(AppColors.grey500),
                  size: 10,
                )
              ],
            ),
            const SizedBox(height: 2,),
            AppLinearProgressIndicator(
              value: dayExploredRate,
              color: Selectors.selectExploredColor(dayExploredRate),
            ),
          ],
        ),
      ),
    );
  }
}
