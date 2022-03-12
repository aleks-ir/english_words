import 'dart:math';

import 'package:flutter/cupertino.dart';

class FlowRoundDelegate extends FlowDelegate {
  final Animation<double> controller;
  final double buttonSize;
  final Offset paddingOffset;

  FlowRoundDelegate(
      {required this.controller,
      required this.buttonSize,
      this.paddingOffset = const Offset(0, 0)})
      : super(repaint: controller);

  @override
  bool shouldRepaint(FlowRoundDelegate oldDelegate) {
    return controller != oldDelegate.controller;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize - paddingOffset.dx;
    final yStart = paddingOffset.dy;

    final n = context.childCount + 1;
    for (int i = context.childCount - 1; i >= 0; i--) {
      final isFirstItem = i == 0;
      final radius = 90 * controller.value;

      final theta = (i + 2) * pi * 0.5 / (n - 2);

      final x = (xStart + radius * cos(theta));
      final y = (yStart + radius * sin(theta));

      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0)
          ..translate(buttonSize / 2, buttonSize / 2)
          ..rotateZ((1 - controller.value) * pi)
          ..translate(-buttonSize / 2, -buttonSize / 2)
          );
    }
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints;
  }
}
