import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ocee/utils/constants.dart';

class MyInputs {
  static Widget formField(
      {String label, Rx<dynamic> toUpdate, bool obscure = false}) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: MyColors.violet),
            borderRadius: BorderRadius.circular(20.0),
          )),
      onChanged: (value) {
        toUpdate.value = value;
      },
      obscureText: obscure,
    );
  }

  static Widget button(
      {String text,
      Function onPress,
      Color backgroundColor,
      double sizeFactor = 1,
      TextStyle style,
      Color textColor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8.0),
      child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: Get.width * sizeFactor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: style == null ? TextStyle(color: textColor) : style,
                  ),
                )),
          )),
    );
  }
}
