import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/presentation/navigation.dart';

import '../app_text_border.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final double progressValue;
  final String label;

  final Color iconColor;
  final Color textColor;
  final Color progressColor;
  final Color backgroundProgressColor;

  const HomeAppBar(
      {required this.progressValue,
      required this.label,
      this.iconColor = const Color(AppColors.color2),
      this.textColor = const Color(AppColors.color2),
      this.progressColor = const Color(AppColors.color4),
      this.backgroundProgressColor = const Color(AppColors.greyDefault),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 70,
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                SizedBox(width: 10,),
                IconButton(
                  splashRadius: 40,
                  icon: const Icon(Icons.manage_search),
                  color: iconColor,
                  onPressed: _navigateTo(context, AppPages.words),
                ),
                Spacer(),
                _buildAnimatedLabel(
                  _navigateTo(context, AppPages.calendar)),
                Spacer(),
                IconButton(
                  splashRadius: 40,
                  icon: const Icon(Icons.playlist_add_check),
                  color: iconColor,
                  onPressed: _navigateTo(context, AppPages.categories),
                ),
                IconButton(
                  splashRadius: 40,
                  icon: const Icon(Icons.settings),
                  color: iconColor,
                  iconSize: 20,
                  onPressed: _navigateTo(context, AppPages.settings),
                ),
                SizedBox(width: 10,),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  VoidCallback _navigateTo(BuildContext context, String page) => () {
        Navigator.of(context).push(Navigation.route(context, page));
      };

  Widget _buildAnimatedLabel(
    VoidCallback callback,
  ) {
    return MaterialButton(
      onPressed: callback,
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child:
                AppTextBorder(title: 'Day 1',
                fontSize: 13,),
                // Text(
                //   label,
                //   style: TextStyle(
                //       fontSize: 17,
                //       fontWeight: FontWeight.w700,
                //       color: textColor,
                //       letterSpacing: 1.5,
                //       fontStyle: FontStyle.italic,
                //       fontFamily: 'Pamega'),
                // )
            ),
            // LinearProgressIndicator(
            //   value: progressValue,
            //   minHeight: 5,
            //   color: progressColor,
            //   backgroundColor: backgroundProgressColor,
            // ),
          ],
        ),
      ),
      height: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
