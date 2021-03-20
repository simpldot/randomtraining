import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/themeController.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/settings/themes.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String> themes = [
    'defaultDark',
    'defaultLight',
    'greenDark',
    'greenLight',
    'pinkDark',
    'pinkLight'
  ];
  List<bool> isSelected = List.generate(6, (_) => false);
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Provider.of<ThemeController>(context);
    isSelected[themes.indexOf(themeController.selectedTheme)] = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text("Settings", style: heading),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Themes",
              style: smallHeading,
            ),
            ToggleButtons(
              children: [
                for (String theme in themes)
                  Container(
                    color: getThemeData(theme).backgroundColor,
                    child: Icon(
                      Icons.stop_rounded,
                      size: 50,
                      color: getThemeData(theme).primaryColor,
                    ),
                  ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      themeController.setTheme(themes[buttonIndex]);
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              selectedBorderColor: Colors.red,
              isSelected: isSelected,
              borderWidth: 3,
            )
          ],
        ),
      ),
    );
  }
}
