import 'dart:math';

import 'package:flutter/cupertino.dart';

class FlowVerticalDelegate extends FlowDelegate {
  final Animation<double> controller;
  final double buttonSize;
  final bool isVisibleKeyboard;

  FlowVerticalDelegate({required this.controller, required this.buttonSize, required this.isVisibleKeyboard})
      : super(repaint: controller);

  @override
  bool shouldRepaint(FlowVerticalDelegate oldDelegate) {
    return controller != oldDelegate.controller;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = _getXStart(size);
    final yStart = _getYStart(size);


    for (int i = context.childCount - 1; i >= 0; i--) {
      const margin = 10;
      final childSize = context
          .getChildSize(i)
          ?.width ?? 0;
      double dx = (childSize + margin) * (i + 1);

      final x = xStart;
      final y = yStart - dx * controller.value;


      context.paintChild(i,
          transform: Matrix4.translationValues(x, y, 0)
            //..translate(buttonSize / 2, buttonSize / 2)
            //..rotateZ(i != 0 ? (180 * (1 - myAnimation.value) * pi / 180) : (90 * ( myAnimation.value) * pi / 180))
            //..translate(-buttonSize / 2, -buttonSize / 2)
      );
    }
  }

  _getXStart(Size size){
    return  size.width - buttonSize - 22;
  }

  _getYStart(Size size){
    if(isVisibleKeyboard){
      return size.height - buttonSize - 20;
    }else{
      return controller.value != 0 ? (size.height - buttonSize/2 - 10) : size.height;
    }
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints;
  }
}
