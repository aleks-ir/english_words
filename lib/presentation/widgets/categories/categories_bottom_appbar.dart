import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

import 'package:word_study_puzzle/common/constants/widget_keys.dart';

class CategoriesBottomAppBar extends StatelessWidget {
  final VoidCallback shopCallback;
  final VoidCallback categoriesCallback;
  final bool isShop;
  final double notchMargin;
  final double height;
  final Color? backgroundColor;
  final Color activeButtonColor;
  final Color activeIconColor;
  final Color splashColor;

  const CategoriesBottomAppBar(
      {required this.shopCallback,
      required this.categoriesCallback,
      required this.isShop,
      this.notchMargin = 5,
      this.height = 50,
      this.backgroundColor,
      this.activeButtonColor = const Color(AppColors.color3),
      this.activeIconColor = const Color(AppColors.whiteDefault),
        this.splashColor = const Color(AppColors.color5),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: notchMargin,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: height,
        child: Row(
          children: <Widget>[
            const Spacer(),
            Material(
              borderRadius: BorderRadius.circular(10.0),
              color: !isShop ? activeButtonColor : activeIconColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  key: const Key(WidgetKeys.categoriesButtonKey),
                  splashRadius: 38,
                  onPressed: categoriesCallback,
                  hoverColor: splashColor,
                  icon: Icon(
                    Icons.receipt,
                    color: !isShop ? activeIconColor : activeButtonColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            Material(
              borderRadius: BorderRadius.circular(10.0),
              color: isShop ? activeButtonColor : activeIconColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  key: const Key(WidgetKeys.shopButtonKey),
                  splashRadius: 38,
                  onPressed: shopCallback,
                  hoverColor: splashColor,
                  icon: Icon(
                    Icons.store,
                    color: isShop ? activeIconColor : activeButtonColor,
                  ),
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
