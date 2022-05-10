import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final IconData? icon;
  final double iconSize;
  final double textSize;
  final EdgeInsets padding;

  const TextIconButton(
      {required this.title,
      required this.callback,
      this.icon,
      this.iconSize = 15,
      this.textSize = 16,
        this.padding = const EdgeInsets.all(5),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: callback,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: iconSize,
                    )
                  : Container(),
              SizedBox(
                width: icon == null ? 0 : 5,
              ),
              Text(
                title,
                style: TextStyle(fontSize: textSize),
              ),
            ],
          ),
        ));
  }
}
