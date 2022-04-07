import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';


class CategoriesStarCount extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? callback;
  final double boarderWidth;
  final Color? textColor;
  final Color iconColor;

  const CategoriesStarCount({
    this.title = '',
    this.callback,
    this.icon,
    this.boarderWidth = 1.5,
    this.textColor,
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
                    color: textColor, fontSize: 16),
              ),
              SizedBox(width: 5,),
              Icon(
                icon,
                color: iconColor,
                size: 15,
              ),
            ],
          ),
        )),
      );
  }
}