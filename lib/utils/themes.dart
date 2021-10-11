import 'package:flutter/material.dart';
import 'package:ocee/utils/constants.dart';

class Themes {
  static final light = ThemeData(
    // Colors
    hintColor: Colors.black,
    backgroundColor: Colors.white,
    primaryColor: MyColors.violet,
    splashColor: MyColors.violet,
    cardColor: MyColors.white,
    hoverColor: MyColors.violet,
    highlightColor: MyColors.violet,
    colorScheme: ColorScheme.light(primary: MyColors.violet),
    cardTheme: CardTheme(color: Colors.white),
    canvasColor: MyColors.white,
    fontFamily: "Montserrat",

    // Checkboxes
    unselectedWidgetColor: MyColors.violet,
    toggleableActiveColor: MyColors.violet,
  );

  static final lightV2 = light.copyWith(
      colorScheme: light.colorScheme.copyWith(secondary: MyColors.violet));
}
