import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/widgets/words/words_view_item.dart';

class HomeTextListWidget extends StatelessWidget {
  final List<String> textList;
  final bool isNumbering;

  HomeTextListWidget(
      {required this.textList, this.isNumbering = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < textList.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
                isNumbering ? '${i + 1}. ${textList[i].capitalize()}' : textList[i].capitalize(),
              style: const TextStyle(fontFamily: "Verdana"),
            ),
          ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return '';
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
