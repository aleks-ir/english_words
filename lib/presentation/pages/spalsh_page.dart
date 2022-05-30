import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';
import 'package:word_study_puzzle/common/constants/app_titles.dart';
import 'package:word_study_puzzle/injection_container.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:word_study_puzzle/presentation/pages/home_page.dart';

class SplashPage extends StatelessWidget {

  final int _duration = 1000;
  final bool isThemeLoaded;

  const SplashPage(this.isThemeLoaded, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isThemeLoaded){
      Future.delayed(Duration(milliseconds: _duration), () async {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_) => BlocProvider<HomeBloc>(
                    create: (_) => sl<HomeBloc>(),
                    child: const HomePage())));
      });
    }
    return Material(
        child: Container(
            color: AppColors.green700,
            alignment: Alignment.center,
            child: const Align(
              child: Text(
                AppTitles.mainTitle,
                style: TextStyle(fontSize: 30, fontFamily: AppFonts.openSans, color: AppColors.whiteDefault),
              ),
              alignment: Alignment.center,
            )
        )
    );
  }
}