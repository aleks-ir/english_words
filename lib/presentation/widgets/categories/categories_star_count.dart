import 'package:flutter/material.dart';

import 'package:word_study_puzzle/common/constants/app_colors.dart';


class CategoriesStarCount extends StatelessWidget {
  final int starCount;
  final double boarderWidth;
  final Color boarderColor;
  final Color iconColor;

  const CategoriesStarCount({
    required this.starCount,
    this.boarderWidth = 1.5,
    this.boarderColor = const Color(AppColors.color4),
    this.iconColor = const Color(AppColors.selectedItemColor),

    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
        height: 40,
        width: 60,
        decoration: BoxDecoration(
          border:
          Border.all(width: boarderWidth, color: boarderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              starCount.toString(),
              style: TextStyle(
                  color: boarderColor, fontSize: 18),
            ),
            Icon(
              Icons.star,
              color: iconColor,
              size: 18,
            ),
          ],
        ),
      ));
      Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
        //color: Color(AppColors.color5),
        border:
        Border.all(width: boarderWidth, color: boarderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            starCount.toString(),
            style: TextStyle(
                color: boarderColor, fontSize: 18),
          ),
          Icon(
            Icons.star,
            color: iconColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}