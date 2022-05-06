import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class CategoriesDialog extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color? backgroundColor;
  final Color confirmColor;
  final Color denyColor;
  final Color? textColor;

  const CategoriesDialog(
      {required this.title,
      required this.callback,
      this.backgroundColor,
      this.confirmColor = const Color(AppColors.green800),
      this.denyColor = const Color(AppColors.grey300),
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
                  fontFamily: "Verdana"),
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
                        'No',
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
                        'Yes',
                        style: TextStyle(color: Color(AppColors.whiteDefault)),
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
