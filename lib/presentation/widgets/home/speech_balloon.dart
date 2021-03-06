import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';


class SpeechBalloon extends StatelessWidget {
  final Widget child;
  final double width;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double nipHeight;
  final EdgeInsets padding;
  final Offset offset;

  const SpeechBalloon({
    Key? key,
    required this.child,
    this.width = 50,
    this.color = AppColors.whiteDefault,
    this.textColor = AppColors.blackDefault,
    this.borderRadius = 2,
    this.nipHeight = 10,
    this.padding = const EdgeInsets.all(10),
    this.offset = Offset.zero,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Offset? innerNipOffset;
    AlignmentGeometry? alignment;
    const vM = 0.2;
    const hM = 1.5;

    final rotatedNipHalfHeight = getNipHeight(nipHeight) / 2;
    final offset = nipHeight / 2 + rotatedNipHalfHeight;
    final value1 = offset - rotatedNipHalfHeight;
    final value2 = -offset + rotatedNipHalfHeight;
    innerNipOffset = this.offset + Offset(value1 * hM, value2 * vM);
    alignment = Alignment.topLeft;

    return Stack(
      alignment: alignment,
      children: [
        frontNip(innerNipOffset),
        frontBalloon(),
      ],
    );
  }

  Widget frontBalloon() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
    ),
      color: color,
      child: Container(
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }

  Widget frontNip(Offset nipOffset) {
    return Transform.translate(
      offset: nipOffset,
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(45 / 360),
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(1),
          ),
          color: color,
          child: SizedBox(
            height: nipHeight,
            width: nipHeight,
          ),
        ),
      ),
    );
  }

  double getNipHeight(double nipHeight) => sqrt(2 * pow(nipHeight, 2));
}
