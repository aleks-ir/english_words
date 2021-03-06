import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_keys.dart';

class CategoriesBottomAppBar extends StatelessWidget {
  final VoidCallback rightCallback;
  final VoidCallback leftCallback;
  final String status;
  final double notchMargin;
  final double height;
  final Color? backgroundButtonColor;
  final Color activeButtonColor;
  final Color? activeIconColor;
  final Color? splashColor;

  const CategoriesBottomAppBar(
      {required this.rightCallback,
      required this.leftCallback,
      required this.status,
      this.notchMargin = 5,
      this.height = 50,
      this.backgroundButtonColor,
      this.activeButtonColor = AppColors.green800,
      this.activeIconColor = AppColors.whiteDefault,
      this.splashColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: height,
        child: Row(
          children: <Widget>[
            Material(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: status == CategoriesPageKeys.leftButtonKey
                  ? activeButtonColor
                  : backgroundButtonColor,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(
                    right: 5,
                    left: status == CategoriesPageKeys.leftButtonKey
                        ? 10
                        : 0),
                child: IconButton(
                  key: const Key(CategoriesPageKeys.leftButtonKey),
                  splashRadius: 1,
                  onPressed: leftCallback,
                  hoverColor: splashColor,
                  icon: Icon(
                    Icons.receipt,
                    color: status == CategoriesPageKeys.leftButtonKey
                        ? activeIconColor
                        : activeButtonColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Material(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              color: status == CategoriesPageKeys.rightButtonKey
                  ? activeButtonColor
                  : backgroundButtonColor,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(
                    right: status == CategoriesPageKeys.rightButtonKey
                        ? 10
                        : 0,
                    left: 5),
                child: IconButton(
                  key: const Key(CategoriesPageKeys.rightButtonKey),
                  splashRadius: 1,
                  onPressed: rightCallback,
                  hoverColor: splashColor,
                  icon: Icon(
                    Icons.store,
                    color: status == CategoriesPageKeys.rightButtonKey
                        ? activeIconColor
                        : activeButtonColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
