import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppDialog extends StatelessWidget {
  final String question;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color confirmColor;
  final Color denyColor;
  final Color textColor;

  const AppDialog(
      {required this.question,
        required this.callback,
        this.backgroundColor = const Color(AppColors.whiteDefault),
        this.confirmColor = const Color(AppColors.color2),
        this.denyColor = const Color(AppColors.greyEnabled),
        this.textColor = const Color(AppColors.color1),
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 0,
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 2), blurRadius: 5),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Text(
              question,
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
                      child: Text('No', style: TextStyle(color: confirmColor),),
                      height: 45,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      onPressed: (){
                        callback();
                        Navigator.pop(context);
                      },
                      textColor: backgroundColor,
                      color: confirmColor,
                      child: const Text('Yes'),
                      height: 45,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
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
