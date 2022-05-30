import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';
import 'package:word_study_puzzle/presentation/utils/string_extension.dart';

class TextList extends StatelessWidget {
  final List<String> textList;
  final bool isNumbering;

  const TextList(
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
              style: const TextStyle(fontFamily: AppFonts.verdana),
            ),
          ),
      ],
    );
  }
}

