import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/presentation/pages/home_page.dart';
import 'package:word_study_puzzle/presentation/widgets/app_splash.dart';

class SplashPage extends StatelessWidget {


  final int _duration = 0;
  final bool isThemeLoaded;

  const SplashPage(this.isThemeLoaded, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isThemeLoaded){
      Future.delayed(Duration(milliseconds: _duration), () async {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_) => const HomePage()));
      });
    }
    return const AppSplash();
  }
}