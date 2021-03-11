import 'package:flutter/material.dart';

ThemeData getThemeData(String themeName) {
  switch (themeName) {
    case 'defaultDark':
      var primaryColor = Color.fromRGBO(93, 133, 255, 1); //#5d85ff
      var backgroundColor = Colors.black;
      return ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        accentColor: primaryColor,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: backgroundColor,
        toggleableActiveColor: primaryColor,
      );
      break;
    default:
      return ThemeData();
  }
}
