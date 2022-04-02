import 'package:flutter/cupertino.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';
import 'package:word_study_puzzle/presentation/widgets/app_progress_indicator.dart';

class ExploredStats extends StatelessWidget {
  final double progressValue;
  final String label;

  const ExploredStats(
      {required this.progressValue, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontFamily: 'Verdana'),),
            const SizedBox(height: 5,),
            AppLinearProgressIndicator(
              value: progressValue,
              color: Selectors.selectExploredColor(progressValue),

            ),
          ],
        ),
      );

  }
}
