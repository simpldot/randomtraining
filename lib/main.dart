import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home/homeView.dart';
import 'views/settings/themeChanger.dart';
import 'views/settings/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (context) => ThemeChanger(getThemeData('defaultDark')),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      theme: theme.getTheme(),
    );
  }
}
