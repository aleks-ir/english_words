import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/widgets/words/words_view_item.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final IconData? icon;
  final double iconSize;
  final double textSize;

  const HomeButton(
      {required this.title,
      required this.callback,
      this.icon,
      this.iconSize = 15,
      this.textSize = 16,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: callback,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: iconSize,
                    )
                  : Container(),
              SizedBox(
                width: icon == null ? 0 : 5,
              ),
              Text(
                title,
                style: TextStyle(fontSize: textSize),
              ),
            ],
          ),
        ));
  }
}
