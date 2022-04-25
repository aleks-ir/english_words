import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class AppSplash extends StatelessWidget {

  const AppSplash({
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: const Color(AppColors.color3),
            alignment: Alignment.center,
            child: const Align(
              child: Text(
                'enWord',
                style: TextStyle(fontSize: 30, fontFamily: 'OpenSans', color: Color(AppColors.whiteDefault),),
              ),
              alignment: Alignment.center,
            )
        )
    );
  }
}