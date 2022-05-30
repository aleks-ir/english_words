
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:word_study_puzzle/common/constants/app_fonts.dart';
import 'package:word_study_puzzle/common/constants/app_titles.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/utils/string_extension.dart';

import 'images_grid_view.dart';
import 'text_list.dart';


class BackCard extends StatelessWidget {
  final List<String> imageUrlList;
  final Word word;

  final flutterTts = FlutterTts();

  BackCard({required this.imageUrlList, required this.word, required Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;
    return
      Card(
        key: key,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(padding: const EdgeInsets.all(20.0),
                child: isPortrait
                    ? _buildContentPortrait(context)
                    : _buildContentAlbum(context)
            )
          ],
        ),
      );
  }

  Widget _buildContentPortrait(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height / 2.5,
            child: ImagesGridView(
              imageUrlList: imageUrlList,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(word.title.capitalize(),
                style: const TextStyle(fontSize: 25.0, fontFamily: AppFonts.verdana)),
            _buildPlayButton()
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
            AppTitles.definitions,
          style: TextStyle(fontSize: 18, fontFamily: AppFonts.verdana),
        ),
        TextList(textList: word.definitionList),
        const SizedBox(
          height: 20,
        ),
        word.examplesList.isNotEmpty
            ? const Text(
            AppTitles.examples,
          style: TextStyle(fontSize: 18, fontFamily: AppFonts.verdana),
        )
            : Container(),
        TextList(textList: word.examplesList),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }

  Widget _buildContentAlbum(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageUrlList.isNotEmpty
            ? Expanded(
          flex: 4,
          child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1.5,
              child: ImagesGridView(
                imageUrlList: imageUrlList,
              )),
        )
            : Container(),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(word.title.capitalize(),
                      style: const TextStyle(
                          fontSize: 25.0, fontFamily: AppFonts.verdana)),
                  _buildPlayButton()
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                AppTitles.definitions,
                style: TextStyle(fontSize: 18, fontFamily: AppFonts.verdana),
              ),
              TextList(textList: word.definitionList),
              const SizedBox(
                height: 20,
              ),
              word.examplesList.isNotEmpty
                  ? const Text(
                  AppTitles.examples,
                style: TextStyle(fontSize: 18, fontFamily: AppFonts.verdana),
              )
                  : Container(),
              TextList(textList: word.examplesList),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayButton() {
    return IconButton(
      onPressed: () {
        _speak(word.title);
      },
      splashRadius: 1,
      icon: const Padding(
        padding: EdgeInsets.only(right: 5.0, top: 5.0),
        child: Icon(
          Icons.volume_up,
          size: 20,
        ),
      ),
    );
  }

  Future _speak(String text) async {
    await flutterTts.speak(text);
  }
}



