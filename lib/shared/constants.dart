import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.white,
      width: 2,
    )),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.pink,
      width: 2,
    )));

const Color backgroundColor = Color(0xFF4A4A58);

const kPrimaryColor = Color(0xFF84AB5C);
const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);
// const kBreakfastColor = Color(0xFFD82D40);
// const kLunchColor = Color(0xFF90AF17);
// const kDinnerColor = Color(0xFF2DBBD8);
// const kSupperColor = Color(0xFFe3cc00);
// const kSnackColor = Color(0xFFa30cfa);

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}
