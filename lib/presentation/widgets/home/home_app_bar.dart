import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';
import 'package:word_study_puzzle/presentation/navigation.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final HomeBloc bloc;
  final Color? iconColor;
  final Color? textColor;

  const HomeAppBar(
      {required this.bloc, this.iconColor, this.textColor, Key? key})
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
                  onPressed: _navigateTo(context, AppPages.words),
                ),
                const Spacer(),
                _buildTextButton(
                  _navigateTo(context, AppPages.categories),
                  "Topics",
                ),
                _buildTextButton(
                  _navigateTo(context, AppPages.stats),
                  'Stats',
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 35,
                  icon: const Icon(Icons.settings),
                  color: iconColor,
                  iconSize: 18,
                  onPressed: _navigateTo(context, AppPages.settings),
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

  VoidCallback _navigateTo(BuildContext context, String page) => () {
        Navigator.of(context)
            .push(Navigation.route(context, page))
            .then(_updateUnexploredWords);
      };

  void _updateUnexploredWords(value) {
    if (value != null && value) {
      bloc.add(InitUnexploredWords());
    }
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
              fontFamily: 'Pamega'),
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
