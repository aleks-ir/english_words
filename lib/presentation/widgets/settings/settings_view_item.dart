import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';

class SettingsViewItem extends StatelessWidget {
  final String title;
  final String tag;
  final VoidCallback callback;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  const SettingsViewItem(
      {required this.title,
      required this.tag,
      required this.callback,
      required this.icon,
        this.iconColor = AppColors.green800,
        this.textColor = AppColors.green900,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: GestureDetector(
        onTap: callback,
        child: Hero(
          tag: tag,
          child: Card(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 10,
            margin: const EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5,),
                Icon(icon, size: 35, color: iconColor),
                const SizedBox(height: 5,),
                Text(title, style: const TextStyle(fontSize: 13, fontFamily: AppFonts.verdana),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
