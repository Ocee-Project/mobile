import 'package:flutter/material.dart';
import 'package:ocee/utils/constants.dart';
import 'package:simple_animations/simple_animations.dart';

class MyImages {
  static Widget logo({scale, duration = 900}) {
    return LoopAnimation<double>(
      tween: Tween(begin: 0.0, end: 360.0),
      duration: Duration(seconds: duration),
      builder: (context, child, value) {
        return Transform.rotate(
          angle: value,
          child: child,
        );
      },
      child: Image.asset(
        "assets/logo.png",
        scale: scale,
      ),
    );
  }
}
