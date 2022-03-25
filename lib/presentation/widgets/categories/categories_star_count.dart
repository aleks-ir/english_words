import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';


class CategoriesStarCount extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? callback;
  final double boarderWidth;
  final Color boarderColor;
  final Color iconColor;

  const CategoriesStarCount({
    this.title = '',
    this.callback,
    this.icon,
    this.boarderWidth = 1.5,
    this.boarderColor = const Color(AppColors.color2),
    this.iconColor = const Color(AppColors.selectedItemColor),

    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: callback,
        child: Card(
          elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
          height: 40,
          width: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: boarderColor, fontSize: 18),
              ),
              SizedBox(width: 3,),
              Icon(
                icon,
                color: iconColor,
                size: 17,
              ),
            ],
          ),
        )),
      );
  }
}