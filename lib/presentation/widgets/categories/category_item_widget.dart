import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';
import 'package:word_study_puzzle/common/constants/category_icons.dart';

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final int indexIconAsset;
  final String description;
  final Function(String, int) changeCategoryCallback;
  final int selectedIndex;
  final Color selectedColor;
  final Color puzzleColor;
  final Color? textColor;

  const CategoryItemWidget(
      {required this.index,
      required this.title,
      required this.indexIconAsset,
      required this.description,
      required this.changeCategoryCallback,
      required this.selectedIndex,
      this.selectedColor = AppColors.green600,
      this.puzzleColor = AppColors.yellow700,
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: index == selectedIndex ? 0 : 10,
      ),
      child: GestureDetector(
          onTap: () => changeCategoryCallback(title, index),
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
                      height: 55,
                      width: 55,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(categoryIconAssets[indexIconAsset])),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: description.isEmpty
                            ? _buildLabelWithoutDescription()
                            : _buildLabelWithDescription()),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ))),
    );
  }

  Widget _buildLabelWithDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: AppFonts.verdana,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
              TextStyle(color: textColor, fontFamily: AppFonts.verdana, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildLabelWithoutDescription() {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontFamily: AppFonts.verdana,
      ),
    );
  }
}
