import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/widgets/home/flip_card.dart';


class HomePageView extends StatefulWidget {
  final PageController pageController;
  final Function(int) pageCallback;
  final bool isCarouselMode;
  final Function(Word, int) selectLetterCallback;
  final Function(Word, int) unselectLetterCallback;
  final Function(Word) openWordCallback;
  final Function(Word) resetWordCallback;
  final List<Word> words;
  final Map<String, List<String>> imageUrlMap;

  const HomePageView({
    required this.pageController,
    required this.pageCallback,
    required this.isCarouselMode,
    required this.words,
    required this.imageUrlMap,
    required this.selectLetterCallback,
    required this.unselectLetterCallback,
    required this.openWordCallback,
    required this.resetWordCallback,
    Key? key})
      : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  double currentPageValue = 0.0;

  @override
  void initState() {
    widget.pageController.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.pageController.removeListener(listen);
    super.dispose();
  }

  void listen() {
    if(!widget.isCarouselMode){
      setState(() {
        currentPageValue = widget.pageController.page!;
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: PageView.builder(
          itemCount: widget.words.length,
          pageSnapping: true,
          padEnds: false,
          controller: widget.pageController,
          onPageChanged: widget.pageCallback,
          itemBuilder: (context, position) {
            if(widget.isCarouselMode){
              return slider(widget.words, position);
            }

            if (position == currentPageValue.floor()) {
              return Transform(
                transform: Matrix4.identity()..rotateY(currentPageValue - position)..rotateZ(currentPageValue - position),
                child: slider(widget.words, position),
              );
            } else if (position == currentPageValue.floor() + 1){
              return Transform(
                transform: Matrix4.identity()..rotateY(currentPageValue - position)..rotateZ(currentPageValue - position),
                child: slider(widget.words, position),
              );
            } else {
              return slider(widget.words, position);
            }
          }

      ),
    );
  }

  Widget slider(images, pagePosition) {
    final word = widget.words.elementAt(pagePosition);
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 90, bottom: 10 ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        curve: Curves.easeInOutCubic,
        child: FlipCard(
          word: word,
          imageUrlList: widget.imageUrlMap[word.title] ?? [],
          selectLetterCallback: widget.selectLetterCallback,
          unselectLetterCallback: widget.unselectLetterCallback,
          openWordCallback: widget.openWordCallback,
          resetWordCallback: widget.resetWordCallback,
        ),
      ),
    );
  }
}
