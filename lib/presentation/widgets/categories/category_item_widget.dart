import 'package:flutter/material.dart';
import 'package:words_3000_puzzle/common/constants/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final bool isShop;
  final String title;
  final Function(String, int) onChanged;
  final int selectedIndex;
  final int cost;
  final String info;
  final Color selectedColor;
  final Color starColor;

  const CategoryItemWidget(
      {required this.index,
      required this.isShop,
      required this.title,
      required this.onChanged,
      required this.selectedIndex,
      required this.cost,
      required this.info,
      this.selectedColor = const Color(AppColors.lightGreen400),
      this.starColor = const Color(AppColors.yellow500),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return Material(
      color: isSelected ? selectedColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
          onTap: () => onChanged(title, index),
          splashColor: Colors.green.withOpacity(0.7),
          overlayColor: MaterialStateProperty.all(selectedColor),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 5),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                  const Spacer(),
                  isShop
                      ? Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 5, right: 10),
                          child: Row(
                            children: [
                              for (var i = 0; i < cost; i++)
                                Icon(
                                  Icons.star,
                                  color: starColor,
                                  size: 15,
                                ),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 5, right: 10),
                          child: Text(
                            info,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                ],
              ))),
    );
  }
}
