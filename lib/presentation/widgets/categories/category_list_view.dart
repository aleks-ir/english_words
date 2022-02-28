import 'package:flutter/material.dart';

import '../../../common/constants/word_status.dart';
import '../../../domain/models/category.dart';
import '../../bloc/bloc_categories/categories_bloc.dart';
import 'category_item_widget.dart';

class CategoryListView extends StatelessWidget {
  final Function(String, int) callback;
  final List<Category> categoryList;
  final int selectedIndex;
  final bool isShop;

  const CategoryListView(
      {
        required this.callback,
        required this.categoryList,
        required this.selectedIndex,
        required this.isShop,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: CategoryItemWidget(
                    index: index,
                    isShop: isShop,
                    selectedIndex: selectedIndex,
                    cost: categoryList[index].openingCost,
                    info: _getCategoryInfo(categoryList[index]),
                    title: categoryList[index].title,
                    onChanged: callback),
              );
            },
          ),
        ));
  }

  String _getCategoryInfo(Category category) {
    if (category.wordList.isEmpty) {
      return '(100/439)';
    }
    final exploredWordCount = category.wordList.length;
    final unexploredWordCount = category.wordList
        .map((word) => word.status == WordStatus.unexplored)
        .toList()
        .length;
    return "($exploredWordCount/$unexploredWordCount)";
  }

}
