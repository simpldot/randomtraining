import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/models/block.dart';
import 'package:randomtraining/models/exercise.dart';
import 'package:randomtraining/models/training.dart';
import 'views/home/homeView.dart';
import 'views/settings/themeController.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BlockAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(TrainingAdapter());
  final Box<dynamic> db = await Hive.openBox('appDB');
  runApp(MyApp(database: db));
}

class MyApp extends StatelessWidget {
  final Box<dynamic> database;
  MyApp({this.database});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController(database)),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      theme: theme.getTheme(),
    );
  }
}
