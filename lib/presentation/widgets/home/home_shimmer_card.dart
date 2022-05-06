import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/domain/models/word.dart';

import 'home_boxes_answer.dart';
import 'home_boxes_letter.dart';
import 'home_button.dart';
import 'home_images_grid_view.dart';
import 'home_speech_balloon.dart';
import 'home_text_list_widget.dart';

class HomeShimmerCard extends StatelessWidget {
  HomeShimmerCard({Key? key}) : super(key: key);

  Word word = Word(
      title: 'shimmer',
      imageUrlList: List.generate(4, (index) => ''),
      letterMap: {
        for (var item in List.generate(16, (index) => index)) item: ''
      });

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Card(
      key: key,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: isPortrait
                  ? _buildContentPortrait(context)
                  : _buildContentAlbum(context)),
        ],
      ),
    );
  }

  Widget _buildContentPortrait(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                HomeButton(
                  title: 'Help',
                  callback: () {},
                  icon: Icons.emoji_objects,
                  iconSize: 17,
                ),
                const Spacer(),
                HomeButton(
                  title: 'Study',
                  callback: () {},
                  icon: Icons.rotate_left,
                  iconSize: 19,
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: _getImageGridViewHeight(context, true),
            child: _buildShimmerImageGridView(_getImageHeight(context, true))),
        const SizedBox(
          height: 20,
        ),
        _buildShimmerBoxesAnswer(context),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Spacer(),
            HomeButton(
              title: 'Reset',
              callback: () {},
            ),
          ],
        ),
        SizedBox(
            height: 100,
            child: _buildShimmerBoxesLetter(
                context, _getLetterBoxSize(context, true))),
      ]),
    );
  }

  Widget _buildContentAlbum(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: _buildShimmerImageGridView(_getImageHeight(context, false))),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  HomeButton(
                    title: 'Help',
                    callback: () {},
                    icon: Icons.emoji_objects,
                    iconSize: 17,
                  ),
                  const Spacer(),
                  HomeButton(
                    title: 'Study',
                    callback: () {},
                    icon: Icons.rotate_left,
                    iconSize: 19,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _buildShimmerBoxesAnswer(context),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Spacer(),
                  HomeButton(
                    title: 'Reset',
                    callback: () {},
                  ),
                ],
              ),
              SizedBox(
                  height: 100,
                  child: _buildShimmerBoxesLetter(
                      context, _getLetterBoxSize(context, false))),
            ]),
          ),
        )
      ],
    );
  }

  Widget _buildShimmerBoxesAnswer(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Theme.of(context).indicatorColor,
      baseColor: Theme.of(context).hoverColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).hoverColor,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildShimmerImageGridView(double imageHeight) {
    return AlignedGridView.count(
        padding: const EdgeInsets.only(top: 0),
        itemCount: 4,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            highlightColor: Theme.of(context).indicatorColor,
            baseColor: Theme.of(context).hoverColor,
            child: Container(
              height: imageHeight,
              decoration: BoxDecoration(
                  color: Theme.of(context).hoverColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        });
  }

  Widget _buildShimmerBoxesLetter(BuildContext context, double boxSize) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: boxSize,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemCount: 16,
        itemBuilder: (BuildContext ctx, index) {
          return Shimmer.fromColors(
            highlightColor: Theme.of(context).indicatorColor,
            baseColor: Theme.of(context).hoverColor,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).hoverColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        });
  }

  double _getLetterBoxSize(BuildContext context, bool isPortrait) {
    return MediaQuery.of(context).size.width / (isPortrait ? 10 : 18);
  }

  double _getImageHeight(BuildContext context, bool isPortrait) {
    return MediaQuery.of(context).size.height / (isPortrait ? 7 : 4);
  }

  double _getImageGridViewHeight(BuildContext context, bool isPortrait) {
    return MediaQuery.of(context).size.height / (isPortrait ? 3 : 1.5);
  }
}
