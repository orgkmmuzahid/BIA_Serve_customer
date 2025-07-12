import 'package:flutter/material.dart';

class AppColors {
  static const Color rewardPointsColor = Colors.orangeAccent;
  static const Color primaryColor = Color.fromRGBO(8, 89, 95, 1);
  static const Color secondary = Color.fromRGBO(51, 51, 51, 1);
  static const Color background = Colors.white;

  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const Color filledColor = Color.fromARGB(0, 255, 255, 255);
  static const Color textFiledColor = Color(0xFF979797);
  static const Color textFiledBorder = Color.fromRGBO(8, 89, 95, 1);
  static const Color disableColor = Color.fromRGBO(194, 194, 194, 1);

  //button
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color.fromRGBO(3, 64, 69, 1), Color.fromRGBO(9, 109, 115, 1)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const blueLight = Color(0xffe8e8f5);
}
