import 'package:flutter/material.dart';

class MyTexts {
  static Widget h1(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 26),
    );
  }

  static Widget h2(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20),
    );
  }
}
