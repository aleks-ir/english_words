import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/category.dart';
import 'package:word_study_puzzle/presentation/widgets/categories/category_item_widget.dart';
import 'package:word_study_puzzle/presentation/widgets/categories/shop_item_widget.dart';


class CategoriesListView extends StatelessWidget {
  final Function(String, int) changeCategoryCallback;
  final Function(Category category) openCategoryCallback;
  final List<Category> categoryList;
  final int selectedIndex;
  final bool isShop;

  const CategoriesListView(
      {required this.changeCategoryCallback,
      required this.openCategoryCallback,
      required this.categoryList,
      required this.selectedIndex,
      required this.isShop,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dividerIndex = _getDividerIndex(categoryList) - 1;
    return SizedBox.expand(
        child: ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return dividerIndex == index ? Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15),
          child: _buildDividerLabel("My topics"),
        ) : Container();
      },
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              right: 10,
              left: 10,
              top: index == 0 ? 90 : 0,
              bottom: index == categoryList.length - 1 ? 10 : 3),
          child: isShop
              ? ShopItemWidget(
                  title: categoryList[index].title,
                  indexIconAsset: categoryList[index].iconAssetIndex,
                  description: categoryList[index].description,
                  openCategoryCallback: () => openCategoryCallback(categoryList[index]),
                  categoryCost: categoryList[index].openingCost)
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0 ? _buildDividerLabel("App topics") : const SizedBox(),
                  CategoryItemWidget(
                      key: Key(categoryList[index].title),
                      index: index,
                      selectedIndex: selectedIndex,
                      title: categoryList[index].title,
                      indexIconAsset: categoryList[index].iconAssetIndex,
                      description: categoryList[index].description,
                      changeCategoryCallback: changeCategoryCallback),
                ],
              ),
        );
      },
    ));
  }

  int _getDividerIndex(List<Category> categoryList) {
    int index = categoryList.where((e) => !e.isEditable).length;
    return index;
  }

  Widget _buildDividerLabel(String title) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 5),
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: "Verdana",
              fontWeight: FontWeight.w500,
              color: Color(
                AppColors.greyDefault,
              ),
              fontSize: 14),
        ));
  }
}
