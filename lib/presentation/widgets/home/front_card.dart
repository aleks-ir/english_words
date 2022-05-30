import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_titles.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/widgets/global/text_icon_button.dart';
import 'package:word_study_puzzle/presentation/widgets/home/answer_boxes.dart';
import 'package:word_study_puzzle/presentation/widgets/home/images_grid_view.dart';
import 'package:word_study_puzzle/presentation/widgets/home/speech_balloon.dart';
import 'package:word_study_puzzle/presentation/widgets/home/text_list.dart';

import 'letter_boxes.dart';



class FrontCard extends StatelessWidget {
  final List<String> imageUrlList;
  final Word word;
  final String definition;
  final Function(Word, int) selectLetterCallback;
  final Function(Word, int) unselectLetterCallback;
  final VoidCallback openWordCallback;
  final VoidCallback resetWordCallback;
  final VoidCallback switchShowHelp;
  final bool isVisibleHelp;

  const FrontCard(
      {required this.imageUrlList,
      required this.word,
      required this.definition,
      required this.selectLetterCallback,
      required this.unselectLetterCallback,
      required this.openWordCallback,
      required this.resetWordCallback,
      required this.switchShowHelp,
      this.isVisibleHelp = false,
      required Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final width = MediaQuery.of(context).size.width;
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
          Visibility(
            visible: isVisibleHelp,
            child: Positioned(
              top: 55,
              left: isPortrait ? width / 25 : width / 2 - width / 25,
              child: SpeechBalloon(
                color: Theme.of(context).primaryColor,
                child: Text(
                  definition,
                  style: const TextStyle(
                    color: AppColors.whiteDefault,
                  ),
                ),
                width: isPortrait ? width / 2 : width / 3,
                borderRadius: 10,
                nipHeight: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentPortrait(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Row(
        children: [
          imageUrlList.isNotEmpty
              ? TextIconButton(
                  title: AppTitles.help,
                  callback: switchShowHelp,
                  icon: Icons.emoji_objects,
                  iconSize: 17,
                )
              : Container(),
          const Spacer(),
          TextIconButton(
            title: AppTitles.study,
            callback: openWordCallback,
            icon: Icons.rotate_left,
            iconSize: 19,
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      imageUrlList.isEmpty
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: TextList(
                textList: word.definitionList,
                isNumbering: false,
              ),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ImagesGridView(
                imageUrlList: imageUrlList,
              )),
      const Spacer(),
      AnswerBoxes(
        word: word,
        boxSize: _getAnswerBoxSize(context, true),
        unselectLetterCallback: unselectLetterCallback,
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          const Spacer(),
          TextIconButton(
            title: AppTitles.reset,
            callback: resetWordCallback,
          ),
        ],
      ),
      LetterBoxes(
        selectLetterCallback: selectLetterCallback,
        word: word,
        boxSize: _getLetterBoxSize(context, true),
      ),
      const Spacer(),
    ]);
  }

  Widget _buildContentAlbum(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: imageUrlList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: TextList(
                    textList: word.definitionList,
                    isNumbering: false,
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: ImagesGridView(
                    imageUrlList: imageUrlList,
                  )),
        ),
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
                  imageUrlList.isNotEmpty
                      ? TextIconButton(
                          title: AppTitles.help,
                          callback: switchShowHelp,
                          icon: Icons.emoji_objects,
                          iconSize: 17,
                        )
                      : Container(),
                  const Spacer(),
                  TextIconButton(
                    title: AppTitles.study,
                    callback: openWordCallback,
                    icon: Icons.rotate_left,
                    iconSize: 19,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AnswerBoxes(
                word: word,
                boxSize: _getAnswerBoxSize(context, false),
                unselectLetterCallback: unselectLetterCallback,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Spacer(),
                  TextIconButton(
                    title: AppTitles.reset,
                    callback: resetWordCallback,
                  ),
                ],
              ),
              LetterBoxes(
                selectLetterCallback: selectLetterCallback,
                word: word,
                boxSize: _getLetterBoxSize(context, false),
              ),
            ]),
          ),
        )
      ],
    );
  }


  double _getLetterBoxSize(BuildContext context, bool isPortrait) {
    return MediaQuery.of(context).size.width / (isPortrait ? 10 : 18);
  }

  double _getAnswerBoxSize(BuildContext context, bool isPortrait) {
    final maxWidth = MediaQuery.of(context).size.width / (isPortrait ? 10 : 20);
    double boxSize = MediaQuery.of(context).size.width /
        word.title.length *
        (isPortrait ? 0.6 : 0.3);
    if (boxSize > maxWidth) {
      boxSize = maxWidth;
    }
    return boxSize;
  }
}
