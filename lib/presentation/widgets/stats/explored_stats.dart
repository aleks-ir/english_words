import 'package:flutter/cupertino.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';
import 'package:word_study_puzzle/presentation/widgets/app_progress_indicator.dart';

class ExploredStats extends StatelessWidget {
  final double progressValue;
  final String label;

  const ExploredStats(
      {required this.progressValue,
      required this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              label,
              style: TextStyle(fontFamily: 'Verdana'),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          AppLinearProgressIndicator(
            value: progressValue,
            color: Selectors.selectExploredColor(progressValue),
          ),
        ],
      ),
    );
  }
}
