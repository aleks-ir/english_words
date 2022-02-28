import 'package:flutter/material.dart';
import 'package:words_3000_puzzle/common/constants/app_colors.dart';

import '../../bloc/bloc_categories/categories_bloc.dart';

class CategoryBottomAppBar extends StatelessWidget {
  final CategoriesBloc bloc;
  final VoidCallback callback;
  final double notchMargin;
  final double height;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color activeColor;
  final Color passiveColor;

  const CategoryBottomAppBar(
      {required this.bloc,
        required this.callback,
        this.notchMargin = 10,
        this.height = 60,
        this.backgroundColor,
        this.buttonColor,
        this.activeColor = Colors.yellow,
        this.passiveColor = const Color(AppColors.whiteDefault),
        Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: notchMargin,
      color: backgroundColor,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: height,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 30,
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.receipt,
                color: bloc.isShop ? passiveColor : activeColor,
              ),
              label: Text(
                "Topic",
                style: TextStyle(
                  color: bloc.isShop ? passiveColor : activeColor,
                ),
              ),
              onPressed: () {
                callback();
                bloc.add(ChangeIsShop(false));},
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.store,
                color: bloc.isShop ? activeColor : passiveColor,
              ),
              label: Text("Store",
                  style: TextStyle(
                    color: bloc.isShop ? activeColor : passiveColor,
                  )),
              onPressed: (){
                callback();
                bloc.add(ChangeIsShop(true));},
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
