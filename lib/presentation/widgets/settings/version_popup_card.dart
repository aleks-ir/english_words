import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';

class VersionPopupCard extends StatefulWidget {
  const VersionPopupCard(
      {required this.title,
        this.iconColor = const Color(AppColors.green800),
      Key? key})
      : super(key: key);

  final String title;
  final Color iconColor;

  @override
  _VersionPopupCardState createState() => _VersionPopupCardState();
}

class _VersionPopupCardState extends State<VersionPopupCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32.0),
      child: Hero(
        tag: AppTags.heroShowVersion,
        child: Material(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 30),
              child: Center(child: Column(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: widget.iconColor,
                    size: 35,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.title),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
