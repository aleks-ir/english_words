import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/presentation/navigation.dart';

import '../app_text_border.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final AnimationController controller;
  final VoidCallback menuCallback;
  final double progressValue;
  final String label;

  final Color iconColor;
  final Color textColor;
  final Color progressColor;
  final Color backgroundProgressColor;

  const HomeAppBar(
      {required this.controller,
      required this.menuCallback,
      required this.progressValue,
      required this.label,
      this.iconColor = const Color(AppColors.color2),
      this.textColor = const Color(AppColors.color3),
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
              child: Stack(alignment: Alignment.center, children: [
                _buildAnimatedLabel(_navigateTo(context, AppPages.calendar)),
                _buildMenuButtons(context),
                _buildLeftButton(),
                _buildRightButton(context)
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

  Widget _buildLeftButton(){
    return Positioned(
      left: 10,
      child: IconButton(
        splashRadius: 40,
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: controller,
          color: iconColor,
        ),
        onPressed: menuCallback,
      ),
    );
  }

  Widget _buildRightButton(BuildContext context){
    return Positioned(
      right: 10,
      child: IconButton(
        splashRadius: 40,
        icon: const Icon(Icons.room_preferences),
        color: iconColor,
        onPressed: _navigateTo(context, AppPages.settings),
      ),
    );
  }

  Widget _buildAnimatedButton(VoidCallback visibleCallback,
      VoidCallback invisibleCallback, String title) {
    final isVisible = controller.status == AnimationStatus.forward;
    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      child: MaterialButton(
        onPressed: isVisible ? visibleCallback : invisibleCallback,
        child: SizedBox(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: textColor,
                letterSpacing: 1.5,
                fontStyle: FontStyle.italic,
                fontFamily: 'Pamega'),
          ),
        ),
        height: double.infinity,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  Widget _buildMenuButtons(
      BuildContext context
  ) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAnimatedButton(_navigateTo(context, AppPages.words),
              _navigateTo(context, AppPages.calendar), 'Words'),
          _buildAnimatedButton(
              _navigateTo(context, AppPages.categories),
              _navigateTo(context, AppPages.calendar),
              'Topics'),
        ],
      ),
    );
  }

  Widget _buildAnimatedLabel(
    VoidCallback callback,
  ) {
    final isVisible = controller.status == AnimationStatus.reverse ||
        controller.status == AnimationStatus.dismissed;
    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      child: MaterialButton(
        onPressed: isVisible ? callback : null,
        child: Container(
          width: 90,
          height: 90,
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: AppTextBorder(
                  title: label,
                  fontSize: 15,
                ),
              ),
              LinearProgressIndicator(
                value: progressValue,
                minHeight: 4,
                color: progressColor,
                backgroundColor: backgroundProgressColor,
              ),
            ],
          ),
        ),
        height: double.infinity,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
