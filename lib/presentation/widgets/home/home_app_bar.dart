import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/common/constants/app_titles.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function(String) navigateTo;

  final Color? iconColor;
  final Color? textColor;

  const HomeAppBar(
      {required this.navigateTo,
      this.iconColor,
      this.textColor,
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
            height: 65,
            color: Colors.transparent,
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  splashRadius: 35,
                  icon: const Icon(Icons.manage_search),
                  color: iconColor,
                  iconSize: 20,
                  onPressed: navigateTo(AppPages.words),
                ),
                const Spacer(),
                _buildTextButton(
                  navigateTo(AppPages.categories),
                  AppTitles.topics,
                ),
                _buildTextButton(
                  navigateTo(AppPages.stats),
                  AppTitles.stats,
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 35,
                  icon: const Icon(Icons.settings),
                  color: iconColor,
                  iconSize: 18,
                  onPressed: navigateTo(AppPages.settings),
                ),
                const SizedBox(
                  width: 5,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildTextButton(VoidCallback callback, String label) {
    return MaterialButton(
      onPressed: callback,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: textColor,
              letterSpacing: 1.5,
              fontFamily: AppFonts.pamega),
        ),
      ),
      height: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
