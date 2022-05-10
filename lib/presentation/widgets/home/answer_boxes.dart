import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/word.dart';


class AnswerBoxes extends StatelessWidget {
  final Word word;
  final double boxSize;
  final Function(Word, int) unselectLetterCallback;

  const AnswerBoxes(
      {required this.word,
        required this.unselectLetterCallback,
        required this.boxSize,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
        SizedBox(
      height: boxSize,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _buildLetterWidgets(boxSize),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLetterWidgets(double boxSize) {
    List<Widget> letterWidgets = [];
    for (var index = 0; index < word.selectedLetterList.length; index++) {
      letterWidgets.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: GestureDetector(
          onTap: () {
            unselectLetterCallback(word, index);
          },
          child: Container(
            width: boxSize,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(word.selectedLetterList[index], style: const TextStyle(fontSize: 10),),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                        color:
                        word.isAnswered != null && !word.isAnswered! ? const Color(AppColors.red) : const Color(AppColors.greyDefault))),
          ),
        ),
      ));
    }
    return letterWidgets;
  }
}
