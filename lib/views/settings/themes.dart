import 'package:flutter/material.dart';

ThemeData _getThemeData(Brightness brightness, Color primaryColor,
    Color backgroundColor, Color textColor) {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: primaryColor,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: backgroundColor,
    backgroundColor: backgroundColor,
    primaryTextTheme: TextTheme(headline6: TextStyle(color: textColor)),
    primaryIconTheme: IconThemeData(
      color: textColor,
    ),
    toggleableActiveColor: primaryColor,
  );
}

ThemeData getThemeData(String themeName) {
  switch (themeName) {
    case 'defaultDark':
      Color primaryColor = Color.fromRGBO(93, 133, 255, 1); //#5d85ff
      Color backgroundColor = Colors.black;
      Color textColor = Colors.white;
      Brightness brightness = Brightness.dark;
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor);
      break;
    case 'defaultLight':
      Color primaryColor = Color.fromRGBO(93, 133, 255, 1); //#5d85ff
      Color backgroundColor = Colors.white;
      Color textColor = Colors.black;
      Brightness brightness = Brightness.light;
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor);
      break;
    case 'greenDark':
      Color primaryColor = Color.fromRGBO(93, 255, 98, 1); //#5dff62
      Color backgroundColor = Colors.black;
      Color textColor = Colors.white;
      Brightness brightness = Brightness.dark;
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor);
      break;
    case 'greenLight':
      Color primaryColor = Color.fromRGBO(93, 255, 98, 1); //#5dff62
      Color backgroundColor = Colors.white;
      Color textColor = Colors.black;
      Brightness brightness = Brightness.light;
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor);
    default:
      return ThemeData();
  }
}
