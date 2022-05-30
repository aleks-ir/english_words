import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/category_icons.dart';

class IconsBar extends StatelessWidget {
  final int selectedIconIndex;
  final Function(int) changeIndexCallback;

  const IconsBar(
      {Key? key, required this.selectedIconIndex, required this.changeIndexCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 12),
      child: Material(
        child: SizedBox(
          height: 70,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (var index = 0; index < categoryIconAssets.length; index++)
                  _IconBox(
                    iconAsset: categoryIconAssets[index],
                    isSelected: index == selectedIconIndex,
                    onTap: () => changeIndexCallback(index),
                  ),
              ]
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox({
    Key? key,
    this.isSelected = false,
    this.onTap,
    required this.iconAsset,
  }) : super(key: key);

  final bool isSelected;
  final String iconAsset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          shape: const CircleBorder(),
          elevation: isSelected ? 5 : 0,
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Image.asset(iconAsset),
          ),
        ),
      ),
    );
  }
}
