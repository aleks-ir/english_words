import 'package:flutter/material.dart';
import 'package:words_3000_puzzle/common/constants/app_colors.dart';

import '../../../common/constants/widget_keys.dart';


class CategoriesBottomAppBar extends StatelessWidget {
  final VoidCallback shopCallback;
  final VoidCallback categoriesCallback;
  final bool isShop;
  final double notchMargin;
  final double height;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color activeColor;
  final Color passiveColor;

  const CategoriesBottomAppBar(
      {required this.shopCallback,
        required this.categoriesCallback,
        required this.isShop,
        this.notchMargin = 10,
        this.height = 60,
        this.backgroundColor,
        this.buttonColor,
        this.activeColor = Colors.yellow,
        this.passiveColor = const Color(AppColors.whiteDefault),
        Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: notchMargin,
      color: backgroundColor,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: height,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 30,
            ),
            ElevatedButton.icon(
              key: const Key(WidgetKeys.categoriesButtonKey),
              icon: Icon(
                Icons.receipt,
                color: isShop ? passiveColor : activeColor,
              ),
              label: Text(
                "Topic",
                style: TextStyle(
                  color: isShop ? passiveColor : activeColor,
                ),
              ),
              onPressed: categoriesCallback,
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton.icon(
              key: const Key(WidgetKeys.shopButtonKey),
              icon: Icon(
                Icons.store,
                color: isShop ? activeColor : passiveColor,
              ),
              label: Text("Store",
                  style: TextStyle(
                    color: isShop ? activeColor : passiveColor,
                  )),
              onPressed: shopCallback,
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
