import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/widgets/words/words_view_item.dart';

class HomeLetterBoxes extends StatelessWidget {
  final Word word;
  final double boxSize;
  final Function(Word, int) selectLetterCallback;

  const HomeLetterBoxes(
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
                          border: Border.all(color: Colors.grey)),
                    )
                  : null,
            );
          }),
    );
  }
}
