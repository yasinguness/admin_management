import 'package:admin_management/common/constants/colors.dart';
import 'package:flutter/material.dart';
part "../themes/text_theme.dart";

const String FONT_FAM = "Oswald";

class CustomTheme {
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    fontFamily: FONT_FAM,
    textTheme: _TextTheme.textThemeLight,
  );

  static ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    fontFamily: FONT_FAM,
    textTheme: _TextTheme.textThemeDar,
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
  );
}
