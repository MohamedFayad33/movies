import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_pallete.dart';

abstract class ThemeManager {
  static ThemeData theme = ThemeData(
    primaryColor: ColorPallete.primaryColor,
    scaffoldBackgroundColor: ColorPallete.primaryColor,
    appBarTheme: AppBarTheme(color: ColorPallete.primaryColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPallete.textFormFieldBackGround,
      selectedItemColor: ColorPallete.buttonBackGround,
      unselectedItemColor: Colors.white,
    ),
  );
}
