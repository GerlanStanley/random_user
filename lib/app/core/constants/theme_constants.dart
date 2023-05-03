import 'package:flutter/material.dart';

import 'colors_constants.dart';

class ThemeConstants {
  static ThemeData dark = ThemeData(
    fontFamily: "NunitoSans",
    primaryColor: ColorsConstants.primary,
    brightness: Brightness.dark,
    backgroundColor: ColorsConstants.background,
    scaffoldBackgroundColor: ColorsConstants.background,
    cardColor: ColorsConstants.card,
    cardTheme: const CardTheme(
      color: ColorsConstants.card,
    ),
    appBarTheme: const AppBarTheme(
      color: ColorsConstants.appBarBackground,
      iconTheme: IconThemeData(color: ColorsConstants.appBarIcon),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: ColorsConstants.appBarText,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        fontFamily: "NunitoSans",
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: ColorsConstants.tabBarSelectedText,
      unselectedLabelColor: ColorsConstants.tabBarUnselectedText,
      unselectedLabelStyle: TextStyle(
        color: ColorsConstants.tabBarUnselectedText,
        fontFamily: "NunitoSans",
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      labelStyle: TextStyle(
        color: ColorsConstants.primary,
        fontFamily: "NunitoSans",
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: ColorsConstants.text,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: "NunitoSans",
      ),
      titleLarge: TextStyle(
        color: ColorsConstants.text,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        fontFamily: "NunitoSans",
      ),
      titleMedium: TextStyle(
        color: ColorsConstants.text,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        fontFamily: "NunitoSans",
      ),
      titleSmall: TextStyle(
        color: ColorsConstants.text,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      bodyLarge: TextStyle(
        color: ColorsConstants.text,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      bodyMedium: TextStyle(
        color: ColorsConstants.textLight,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      bodySmall: TextStyle(
        color: ColorsConstants.text,
        fontWeight: FontWeight.normal,
        fontSize: 12,
        fontFamily: "NunitoSans",
      ),
    ),
  );
}
