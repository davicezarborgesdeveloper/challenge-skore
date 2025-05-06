import 'package:flutter/material.dart';
import 'package:skore/presentation/resources/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.background,
    appBarTheme: AppBarTheme(color: ColorManager.primary),
    useMaterial3: false,
    primaryColor: ColorManager.primary,
  );
}
