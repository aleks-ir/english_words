import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class CategoriesItemWidget extends StatelessWidget {
  final int index;
  final bool isShop;
  final String title;
  final Function(String, int) onChanged;
  final int selectedIndex;
  final int categoryCost;
  final String info;
  final Color selectedColor;
  final Color starColor;
  final Color textColor;

  const CategoriesItemWidget(
      {required this.index,
      required this.isShop,
      required this.title,
      required this.onChanged,
      required this.selectedIndex,
      required this.categoryCost,
      required this.info,
      this.selectedColor = const Color(AppColors.color6),
      this.starColor = const Color(AppColors.selectedItemColor),
      this.textColor = const Color(AppColors.blackDefault),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return Material(
      color: isSelected ? selectedColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
          onTap: () => onChanged(title, index),
          splashColor: Colors.green.withOpacity(0.7),
          overlayColor: MaterialStateProperty.all(selectedColor),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 13, bottom: 13, left: 20),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: "Windstone",
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              fontSize: 16),
                        )),
                    !isShop ? Container() : const Spacer(),
                    !isShop ? Container() : Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 5, right: 10),
                      child: Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            Icon(
                              Icons.extension,
                              color: i < categoryCost ? starColor : Colors.grey,
                              size: 13,
                            ),
                        ],
                      ),
                    )
                  ],
                ))),
    );
  }

  Widget _buildLabel() {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontFamily: "OpenSans",
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          fontSize: 18),
    );
  }
}
