import 'dart:math';

import 'package:flutter/cupertino.dart';


class FlowRoundDelegate extends FlowDelegate {
  final Animation<double> controller;
  final double buttonSize;
  final Offset paddingOffset;

  FlowRoundDelegate(
      {required this.controller,
        this.buttonSize = 48,
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
      final radius = 50 * controller.value;

      final theta = (i + 1) * pi * 0.67 / (n - 2);

      final x = isFirstItem ? xStart : (xStart + radius * cos(theta));
      final y = isFirstItem ? yStart : (yStart + radius * sin(theta));

      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0)
        ..translate(buttonSize / 2, buttonSize / 2)
        ..rotateZ(controller.value * pi)
        ..scale(isFirstItem ? 1.0 : max(controller.value, 0))
        ..translate(-buttonSize / 2, -buttonSize / 2)
      );
    }
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints;
  }
}