import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/category_icons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_material_button.dart';

class ShopPopupCard extends StatelessWidget {
  final Function() callback;
  final String title;
  final String description;
  final int openingCost;
  final int indexIconAsset;
  final String heroTag;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? textColor;
  final Color? iconColor;

  const ShopPopupCard(
      {required this.callback,
      required this.heroTag,
      this.title = '',
      this.description = '',
      this.openingCost = 10,
      required this.indexIconAsset,
      this.backgroundColor,
      this.textColor,
      this.buttonColor = const Color(AppColors.green800),
      this.iconColor = const Color(AppColors.yellow),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15.0),
      child: Hero(
        tag: heroTag,
        child: Material(
          color: backgroundColor,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 0, right: 0, left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset(categoryIconAssets[indexIconAsset])),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: textColor,
                                fontFamily: "Verdana",
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              description,
                              style: TextStyle(
                                  color: textColor,
                                  fontFamily: "Verdana",
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "$openingCost x ",
                            style: TextStyle(
                                color: textColor,
                                fontFamily: "Verdana",
                                fontSize: 12),
                          ),
                          Icon(
                            Icons.whatshot,
                            color: iconColor,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(
                      thickness: 1,
                      height: 10,
                    ),
                  ),
                  AppMaterialButton(
                    callback: () {
                      callback();
                      Navigator.pop(context);
                    },
                    title: "Open",
                    backgroundColor: buttonColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
