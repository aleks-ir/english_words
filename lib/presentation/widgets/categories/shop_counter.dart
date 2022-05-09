import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';


class ShopCounterWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? callback;
  final double boarderWidth;
  final Color? textColor;
  final Color iconColor;

  const ShopCounterWidget({
    this.title = '',
    this.callback,
    this.icon,
    this.boarderWidth = 1.5,
    this.textColor,
    this.iconColor = const Color(AppColors.yellow),

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
            child: SizedBox(
          height: 40,
          width: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: textColor, fontSize: 12),
              ),
              const SizedBox(width: 2,),
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