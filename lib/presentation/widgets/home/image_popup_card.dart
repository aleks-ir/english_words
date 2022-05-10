import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagePopupCard extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const ImagePopupCard(
      {required this.imageUrl,
        required this.heroTag,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Hero(
        tag: heroTag,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrl,
                    fit: BoxFit.fitHeight,
                  )),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}
