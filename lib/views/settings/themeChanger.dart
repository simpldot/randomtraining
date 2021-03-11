import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  final _themePreference = "theme_preference";

  ThemeChanger(this._themeData) {
    _loadTheme();
  }

  void _loadTheme() {
    SharedPreferences.getInstance().then((prefs) {
      String selectedTheme = prefs.getString(_themePreference) ?? 'defaultDark';
      _themeData = getThemeData(selectedTheme);
      notifyListeners();
    });
  }

  getTheme() => _themeData;
  setTheme(String themeName) async {
    _themeData = getThemeData(themeName);
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_themePreference, themeName);
    notifyListeners();
  }
}
