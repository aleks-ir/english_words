import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color confirmColor;
  final Color textColor;

  const AppDialog(
      {required this.title,
        required this.callback,
        this.backgroundColor = const Color(AppColors.whiteDefault),
        this.confirmColor = const Color(AppColors.color3),
        this.textColor = const Color(AppColors.color1),
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
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
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w500,
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
                      color: Colors.grey,
                      child: const Text('No'),
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
                      child: Text('Yes'),
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
