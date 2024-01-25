import 'package:flutter/material.dart';

ThemeData _getThemeData(Brightness brightness, Color primaryColor,
    Color backgroundColor, Color textColor, Color cardColor) {
  return ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: backgroundColor,
      primaryTextTheme: TextTheme(titleLarge: TextStyle(color: textColor)),
      primaryIconTheme: IconThemeData(
        color: textColor,
      ),
      cardColor: cardColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: cardColor,
        contentTextStyle: TextStyle(color: textColor),
        actionTextColor: textColor,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor), checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return primaryColor; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return primaryColor; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return primaryColor; }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return primaryColor; }
 return null;
 }),
 ), colorScheme: ColorScheme(background: backgroundColor));
}

ThemeData getThemeData(String themeName) {
  switch (themeName) {
    case 'defaultDark':
      Color primaryColor = Color.fromRGBO(93, 133, 255, 1); //#5d85ff
      Color backgroundColor = Colors.black;
      Color textColor = Colors.white;
      Brightness brightness = Brightness.dark;
      Color cardColor = Colors.grey[800];
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor, cardColor);
      break;
    case 'defaultLight':
      Color primaryColor = Color.fromRGBO(93, 133, 255, 1); //#5d85ff
      Color backgroundColor = Colors.white;
      Color textColor = Colors.black;
      Brightness brightness = Brightness.light;
      Color cardColor = Colors.grey[300];
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor, cardColor);
      break;
    case 'greenDark':
      Color primaryColor = Color.fromRGBO(93, 255, 98, 1); //#5dff62
      Color backgroundColor = Colors.black;
      Color textColor = Colors.white;
      Brightness brightness = Brightness.dark;
      Color cardColor = Colors.grey[800];
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor, cardColor);
      break;
    case 'greenLight':
      Color primaryColor = Color.fromRGBO(93, 255, 98, 1); //#5dff62
      Color backgroundColor = Colors.white;
      Color textColor = Colors.black;
      Brightness brightness = Brightness.light;
      Color cardColor = Colors.grey[300];
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor, cardColor);
    case 'pinkDark':
      Color primaryColor = Color.fromRGBO(255, 93, 239, 1); //#ff5def
      Color backgroundColor = Colors.black;
      Color textColor = Colors.white;
      Brightness brightness = Brightness.dark;
      Color cardColor = Colors.grey[800];
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor, cardColor);
      break;
    case 'pinkLight':
      Color primaryColor = Color.fromRGBO(255, 93, 239, 1); //#ff5def
      Color backgroundColor = Colors.white;
      Color textColor = Colors.black;
      Brightness brightness = Brightness.light;
      Color cardColor = Colors.grey[300];
      return _getThemeData(
          brightness, primaryColor, backgroundColor, textColor, cardColor);
    default:
      return ThemeData();
  }
}
