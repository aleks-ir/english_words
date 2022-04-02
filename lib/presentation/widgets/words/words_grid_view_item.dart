import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class WordsGridViewItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback pressCallback;
  final VoidCallback doublePressCallback;
  final bool isSelected;
  final Color? color;
  final Color selectedColor;
  final Color splashColor;

  const WordsGridViewItem(
      {required this.title,
      required this.imageUrl,
      required this.pressCallback,
      required this.doublePressCallback,
      this.isSelected = false,
      this.color,
      this.selectedColor = const Color(AppColors.color6),
      this.splashColor = const Color(AppColors.color5),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? selectedColor : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
          onDoubleTap: doublePressCallback,
          onTap: pressCallback,
          splashColor: isSelected ? Colors.white : selectedColor,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: imageUrl.isEmpty
                ? Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(title,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Column(
                      //alignment: Alignment.bottomCenter,
                      children: [
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Container(
                            height: 30,
                            color: Colors.white,
                            child: Center(
                                child: Text(
                              title,
                              style: const TextStyle(fontSize: 15),
                            ))),
                      ],
                    )),
          )),
    );
  }
}
