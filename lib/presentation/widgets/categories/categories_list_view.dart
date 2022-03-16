import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

import 'package:word_study_puzzle/domain/models/category.dart';
import 'categories_item_widget.dart';

class CategoriesListView extends StatelessWidget {
  final Function(String, int) callback;
  final List<Category> categoryList;
  final int selectedIndex;
  final bool isShop;

  const CategoriesListView(
      {required this.callback,
      required this.categoryList,
      required this.selectedIndex,
      required this.isShop,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dividerIndex = _getDividerIndex(categoryList) - 1;
    return SizedBox.expand(
        child: Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return dividerIndex == index ? Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("My topics", style: TextStyle(
                    fontFamily: "Verdana",
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.greyDefault,), fontSize: 16),),
                Divider( thickness: 1,),
              ],
            ),
          ) : Container();
        },
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: 20, left: 20, top: 3, bottom: dividerIndex == index ? 20 : 3),
            child: CategoriesItemWidget(
                key: Key(categoryList[index].title),
                index: index,
                isShop: isShop,
                selectedIndex: selectedIndex,
                categoryCost: categoryList[index].openingCost,
                info: '',
                title: categoryList[index].title,
                onChanged: callback),
          );
        },
      ),
    ));
  }

  int _getDividerIndex(List<Category> categoryList) {
    int index = categoryList.where((e) => !e.isEditable).length;
    return index;
  }

  // String _getCategoryInfo(Category category) {
  //   if (category.wordList.isEmpty) {
  //     return '(100/439)';
  //   }
  //   final exploredWordCount = category.wordList.length;
  //   final unexploredWordCount = category.wordList
  //       .map((word) => word.status == WordStatus.unexplored)
  //       .toList()
  //       .length;
  //   return "($exploredWordCount/$unexploredWordCount)";
  // }
}
