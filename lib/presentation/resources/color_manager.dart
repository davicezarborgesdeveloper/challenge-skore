import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#5CCFB3");
  static Color background = HexColor.fromHex("#f8f8ff");
  // static Color background = HexColor.fromHex("#E6F7F2");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
