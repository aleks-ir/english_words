
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/word.dart';

class LetterBoxes extends StatelessWidget {
  final Word word;
  final double boxSize;
  final Function(Word, int) selectLetterCallback;

  const LetterBoxes(
      {required this.word,
        required this.boxSize,
        required this.selectLetterCallback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: boxSize,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: word.letterMap.length,
          itemBuilder: (BuildContext ctx, index) {
            final letter = word.letterMap[index] ?? '';
            return GestureDetector(
              onTap: () {
                selectLetterCallback(word, index);
              },
              child: letter.isNotEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(letter),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.greyDefault)),
                    )
                  : null,
            );
          }),
    );
  }
}
