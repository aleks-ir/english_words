import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_field.dart';

class AppInputPopupCard extends StatelessWidget {
  final Function(String) callback;
  final String title;
  final String buttonTitle;
  final String heroTag;
  final Color? backgroundColor;
  final Color? textColor;
  final Color buttonColor;

  final _textFieldController = TextEditingController();

  AppInputPopupCard(
      {required this.callback,
      required this.heroTag,
      this.title = '',
        this.buttonTitle = 'Confirm',
        this.backgroundColor,
      this.textColor,
      this.buttonColor = const Color(AppColors.green800),
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
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          fontFamily: "Verdana"),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AppTextField(
                    callback: () {
                      callback(_textFieldController.value.text);
                      Navigator.pop(context);
                    },
                    backgroundColor: backgroundColor,
                    controller: _textFieldController,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      callback(_textFieldController.value.text);
                      Navigator.pop(context);
                    },
                    textColor: Colors.white,
                    color: buttonColor,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(buttonTitle),
                    ),
                    height: 40,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
