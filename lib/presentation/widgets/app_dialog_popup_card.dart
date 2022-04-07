import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppDialogPopupCard extends StatelessWidget {
  final Function() callback;
  final String title;
  final String heroTag;
  final Color? backgroundColor;
  final Color confirmColor;
  final Color denyColor;
  final Color? textColor;

  AppDialogPopupCard(
      {required this.callback,
      required this.heroTag,
      this.title = '',
      this.backgroundColor,
      this.confirmColor = const Color(AppColors.color2),
      this.denyColor = const Color(AppColors.greyLight),
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32.0),
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
                  top: 30.0, bottom: 20, right: 40, left: 40),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
                      width: 200,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: MaterialButton(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: MaterialButton(
                              onPressed: () {
                                callback();
                                Navigator.pop(context);
                              },
                              textColor: backgroundColor,
                              color: confirmColor,
                              child: const Text('Yes'),
                              height: 40,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
