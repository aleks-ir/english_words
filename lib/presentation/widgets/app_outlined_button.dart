import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final Color? textColor;
  final Color borderColor;

  const AppOutlinedButton(
      {required this.callback,
        this.title = '',
        this.borderColor = const Color(AppColors.blackDefault),
        this.textColor,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: callback,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
        overlayColor: MaterialStateProperty.all(Colors.black12),
        side: MaterialStateProperty.all(BorderSide(color: borderColor, width: 1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(title,
          style: TextStyle(color: textColor, fontSize: 15),
          strutStyle: const StrutStyle()),
    );
  }
}
