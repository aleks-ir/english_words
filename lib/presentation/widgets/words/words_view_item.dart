import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class WordsViewItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isListView;
  final VoidCallback pressCallback;
  final VoidCallback doublePressCallback;
  final bool isSelected;
  final Color? color;
  final Color selectedColor;
  final Color splashColor;

  const WordsViewItem(
      {required this.title,
      required this.imageUrl,
      required this.isListView,
      required this.pressCallback,
      required this.doublePressCallback,
      this.isSelected = false,
      this.color,
      this.selectedColor = const Color(AppColors.color4),
      this.splashColor = const Color(AppColors.color5),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? selectedColor : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
          onDoubleTap: doublePressCallback,
          onTap: pressCallback,
          splashColor: Colors.transparent,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: isListView ? _getListView() : _getGridView(),
          )),
    );
  }

  Widget _getListView() {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: imageUrl.isNotEmpty
                  ? FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/no_image.png')),
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Verdana",
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _getGridView() {
    if (imageUrl.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: "Verdana",
          ),
        ),
      );
    } else {
      return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Verdana",
                    ),
                  )),
            ],
          ));
    }
  }
}
