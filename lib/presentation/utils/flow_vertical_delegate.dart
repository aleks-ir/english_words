import 'dart:math';

import 'package:flutter/cupertino.dart';

class FlowVerticalDelegate extends FlowDelegate {
  final Animation<double> controller;
  final double buttonSize;

  FlowVerticalDelegate({required this.controller, required this.buttonSize})
      : super(repaint: controller);

  @override
  bool shouldRepaint(FlowVerticalDelegate oldDelegate) {
    return controller != oldDelegate.controller;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = buttonSize - 30;
    final yStart = size.height - buttonSize - 20;


    for (int i = context.childCount - 1; i >= 0; i--) {
      const margin = 5;
      final childSize = context
          .getChildSize(i)
          ?.width ?? 0;
      double dx = (childSize + margin) * i;

      final x = xStart;
      final y = yStart - dx * controller.value;


      context.paintChild(i,
          transform: Matrix4.translationValues(x, y, 0)
            ..translate(buttonSize / 2, buttonSize / 2)
            ..rotateZ( ((controller.value) * pi) )
            ..translate(-buttonSize / 2, -buttonSize / 2)
      );
    }
  }


  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints;
  }
}
