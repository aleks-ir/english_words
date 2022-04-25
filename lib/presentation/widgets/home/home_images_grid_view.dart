import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/utils/hero_dialog_route.dart';
import 'package:word_study_puzzle/presentation/widgets/app_image_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/words/words_view_item.dart';

class HomeImagesGridView extends StatelessWidget {
  final List<String> imageUrlList;

  const HomeImagesGridView({required this.imageUrlList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: imageUrlList.length,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final imageKey = UniqueKey();
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return AppImagePopupCard(heroTag: imageKey.toString(),
                imageUrl: imageUrlList[index],
              );
            }));
          },
          child: Hero(
            tag: imageKey.toString(),
            child: Container(
              alignment: Alignment.center,
              child: imageUrlList[index].isNotEmpty ? ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child:  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrlList[index],
                    fit: BoxFit.fitHeight,
                  )) : Container(),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        );
      },
    );
  }
}
