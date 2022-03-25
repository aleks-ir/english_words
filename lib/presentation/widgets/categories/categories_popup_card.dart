import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_field.dart';

class CategoriesPopupCard extends StatelessWidget {
  final Function(String) callback;
  final Color textColor;
  final Color buttonColor;

  final _textFieldController = TextEditingController();

  CategoriesPopupCard(
      {required this.callback,
      this.textColor = const Color(AppColors.color1),
        this.buttonColor = const Color(AppColors.color2),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32.0),
      child: Hero(
        tag: AppTags.heroAddTopic,
        child: Material(
          color: Color(AppColors.whiteDefault),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter a topic',
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontFamily: "Verdana"),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AppTextField(
                      callback: (){
                        callback(_textFieldController.value.text);
                        Navigator.pop(context);
                      }, controller: _textFieldController,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: (){
                      callback(_textFieldController.value.text);
                      Navigator.pop(context);
                    },
                    textColor: Colors.white,
                    color: buttonColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Confirm'),
                    ),
                    height: 45,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                  ),
                  // TextButton(onPressed: (){
                  //   callback(_textFieldController.value.text);
                  //   Navigator.pop(context);
                  // },
                  // child: const Text('Confirm'),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
