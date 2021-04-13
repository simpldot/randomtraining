import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../views/settings/themes.dart';

class ThemeController extends ChangeNotifier {
  ThemeData _themeData;
  final _theme = 'theme';
  String selectedTheme = 'defaultDark';
  Box theme;

  ThemeController() {
    _loadTheme();
  }

  void _loadTheme() async {
    theme = await Hive.openBox('settings');
    selectedTheme = theme.get(_theme) ?? 'defaultDark';
    _themeData = getThemeData(selectedTheme);
    notifyListeners();
  }

  getTheme() => _themeData;

  setTheme(String themeName) async {
    selectedTheme = themeName;
    _themeData = getThemeData(themeName);
    theme.put(_theme, themeName);
    notifyListeners();
  }
}
