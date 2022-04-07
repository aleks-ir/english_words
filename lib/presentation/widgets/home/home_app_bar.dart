import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/presentation/navigation.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final double progressValue;
  final String label;

  final Color? iconColor;
  final Color? textColor;

  const HomeAppBar(
      {required this.progressValue,
      required this.label,
      this.iconColor,
      this.textColor ,
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
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  splashRadius: 40,
                  icon: const Icon(Icons.manage_search),
                  color: iconColor,
                  onPressed: _navigateTo(context, AppPages.words),
                ),
                const Spacer(),
                _buildAnimatedLabel(_navigateTo(context, AppPages.calendar)),
                const Spacer(),
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
                const SizedBox(
                  width: 10,
                ),
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
      child: SizedBox(
        width: 60,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: textColor,
                letterSpacing: 1.5,
                fontFamily: 'Pamega'),
          ),
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
