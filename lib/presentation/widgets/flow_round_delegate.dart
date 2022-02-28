import 'dart:math';

import 'package:flutter/cupertino.dart';

class FlowRoundDelegate extends FlowDelegate {
  final Animation<double> myAnimation;
  final double buttonSize;

  FlowRoundDelegate({required this.myAnimation, required this.buttonSize})
      : super(repaint: myAnimation);

  @override
  bool shouldRepaint(FlowRoundDelegate oldDelegate) {
    return myAnimation != oldDelegate.myAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width/2 - buttonSize/2;
    final yStart = size.height - buttonSize / 2;

    final n = context.childCount + 1;
    for (int i = context.childCount - 1; i >= 0; i--) {
      final isFirstItem = i == 0;
      final radius = 70 * myAnimation.value;

      final theta = (i + 1) * pi * 0.5 / (n - 2);

      final x = (xStart - radius * cos(theta));
      final y = (yStart - radius * sin(theta));


      context.paintChild(i,
          transform: Matrix4.translationValues(x, y, 0)
            //..translate(buttonSize / 2, buttonSize / 2)
            //..rotateZ(i != 0 ? (180 * (1 - myAnimation.value) * pi / 180) : (90 * ( myAnimation.value) * pi / 180))
            //..translate(-buttonSize / 2, -buttonSize / 2)
      );
    }
  }


  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints;
  }
}
