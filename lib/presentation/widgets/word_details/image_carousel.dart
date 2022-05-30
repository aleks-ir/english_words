import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  late PageController _pageController;
  final Function(int) pageCallback;
  final List<String> imagesUrl;
  final int initPage;
  final int activePage;

  ImageCarousel({required this.pageCallback, required this.imagesUrl,required this.initPage, this.activePage = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    _pageController = PageController(viewportFraction: 0.85, initialPage: initPage);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: isPortrait ? 240 : 360,
      child: PageView.builder(
          itemCount: imagesUrl.length,
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: pageCallback,
          itemBuilder: (context, pagePosition) {
            bool active = pagePosition == activePage;
            return slider(imagesUrl, pagePosition, active);
          }),
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 5 : 15;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(images[pagePosition]))),
    );
  }


}
