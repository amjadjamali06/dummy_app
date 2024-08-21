import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomTheme {
  static const AppBarTheme appBarTheme = AppBarTheme(
    elevation: 6,
    foregroundColor: kTextColor,
    backgroundColor: kPrimaryDarkColor,
    surfaceTintColor: Colors.black,
    shadowColor: kBlackColor,
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(color: kTextColor, fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: kTextColor, fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(color: kTextColor, fontSize: 36, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(color: kTextColor, fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: kTextColor, fontSize: 28, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: kTextColor, fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(color: kTextColor, fontSize: 22, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(color: kTextColor, fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(color: kTextColor, fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(color: kTextColor, fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(color: kTextColor, fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(color: kTextColor, fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(color: kTextColor, fontSize: 14, fontWeight: FontWeight.bold),
    labelMedium: TextStyle(color: kTextColor, fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(color: kTextColor, fontSize: 11, fontWeight: FontWeight.w500),
  );
}