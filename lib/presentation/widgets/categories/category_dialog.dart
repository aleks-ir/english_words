import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';
import 'package:word_study_puzzle/common/constants/app_titles.dart';

class CategoryDialog extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color? backgroundColor;
  final Color confirmColor;
  final Color denyColor;
  final Color? textColor;

  const CategoryDialog(
      {required this.title,
      required this.callback,
      this.backgroundColor,
      this.confirmColor = AppColors.green800,
      this.denyColor = AppColors.grey300,
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Material(
        color: backgroundColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.verdana),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      textColor: backgroundColor,
                      color: denyColor,
                      child: Text(
                        AppTitles.no,
                        style: TextStyle(color: confirmColor),
                      ),
                      height: 40,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        callback();
                        Navigator.pop(context);
                      },
                      textColor: backgroundColor,
                      color: confirmColor,
                      child: const Text(
                        AppTitles.yes,
                        style: TextStyle(color: AppColors.whiteDefault),
                      ),
                      height: 40,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
