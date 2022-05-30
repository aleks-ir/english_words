import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';
import 'package:word_study_puzzle/common/constants/category_icons.dart';


class ShopItemWidget extends StatelessWidget {
  final String title;
  final int indexIconAsset;
  final String description;
  final VoidCallback openCategoryCallback;
  final int categoryCost;
  final Color selectedColor;
  final Color puzzleColor;
  final Color? textColor;

  const ShopItemWidget(
      {required this.title,
      required this.indexIconAsset,
      required this.description,
      required this.openCategoryCallback,
      required this.categoryCost,
      this.selectedColor = AppColors.green600,
      this.puzzleColor = AppColors.yellow700,
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openCategoryCallback,
      child: Hero(
        tag: title,
        child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(categoryIconAssets[indexIconAsset])),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: textColor,
                          fontFamily: AppFonts.verdana,
                        ),
                      )),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${categoryCost.toString()} x',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        Icons.whatshot,
                        color: AppColors.yellow700,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            )),
      ),
    );
  }
}
