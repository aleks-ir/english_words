import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideMenu extends StatelessWidget {
  AnimationController controller;
  final Widget child;
  final List<Widget> menuItems;

  SlideMenu(
      {Key? key,
      required this.controller,
      required this.child,
      required this.menuItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation =
        Tween(begin: const Offset(0.0, 0.0), end: const Offset(-0.15, 0.0))
            .animate(CurveTween(curve: Curves.decelerate).animate(controller));

    return GestureDetector(
      onHorizontalDragEnd: (drag) {
        if (drag.primaryVelocity! > 0) {
          controller.animateTo(.0);
        } else if (drag.primaryVelocity! < 0) {
          controller.animateTo(1.0);
        } else {
          controller.animateTo(.0);
        }
      },
      child: Stack(
        children: <Widget>[
          SlideTransition(position: animation, child: child),
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          right: .0,
                          top: .0,
                          bottom: .0,
                          width: constraint.maxWidth * animation.value.dx * -1,
                          child: Container(
                            color: Colors.black26,
                            child: Row(
                              children: menuItems.map((child) {
                                return Expanded(
                                  child: child,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
