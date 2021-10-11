import 'package:flutter/material.dart';
import 'package:ocee/utils/constants.dart';

class MyImages {
  static Widget logo({scale}) {
    return Image.asset(
      "assets/logo.png",
      scale: scale,
    );
  }
}
