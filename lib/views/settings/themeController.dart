import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'themes.dart';

class ThemeController extends ChangeNotifier {
  ThemeData _themeData;
  final _theme = 'theme';
  Box database;

  ThemeController(database) {
    this.database = database;
    _loadTheme();
  }

  void _loadTheme() {
    String selectedTheme = database.get(_theme) ?? 'defaultDark';
    _themeData = getThemeData(selectedTheme);
    notifyListeners();
  }

  getTheme() => _themeData;

  setTheme(String themeName) async {
    _themeData = getThemeData(themeName);
    database.put(_theme, themeName);
    notifyListeners();
  }
}
