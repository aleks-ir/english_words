import 'package:flutter/cupertino.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';
import 'package:word_study_puzzle/presentation/widgets/app_progress_indicator.dart';

class StatsProgress extends StatelessWidget {
  final double progressValue;
  final String label;

  const StatsProgress(
      {required this.progressValue,
      required this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontFamily: 'Verdana'),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          AppLinearProgressIndicator(
            value: progressValue,
            color: Selectors.selectExploredColor(progressValue),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
