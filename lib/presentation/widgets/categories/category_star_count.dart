import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';


class CategoryStarCount extends StatelessWidget {
  final int starCount;
  final double boarderWidth;
  final Color boarderColor;

  const CategoryStarCount({
    required this.starCount,
    this.boarderWidth = 3,
    this.boarderColor = const Color(AppColors.lightGreen700),

    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
        border:
        Border.all(width: boarderWidth, color: const Color(AppColors.lightGreen700)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            starCount.toString(),
            style: const TextStyle(
                color: Color(AppColors.lightGreen700), fontSize: 18),
          ),
          const Icon(
            Icons.star,
            color: Color(
              AppColors.yellow500,
            ),
            size: 20,
          ),
        ],
      ),
    );
  }
}