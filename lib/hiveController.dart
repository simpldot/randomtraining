import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/training.dart';

class HiveController extends ChangeNotifier {
  Box trainingsBox;
  final String _trainingsKey = 'trainings';
  List<Training> _trainings;

  HiveController(trainingsBox) {
    this.trainingsBox = trainingsBox;
    _trainings = trainingsBox.containsKey(_trainingsKey)
        ? trainingsBox.get(_trainingsKey)
        : [];
  }

  List<Training> get trainings => _trainings;

  addTraining(String title, String desc) {
    Training newTraining = Training(title, desc, []);
    _trainings.add(newTraining);
    print(_trainings);
    trainingsBox.add(newTraining);
    notifyListeners();
  }
}
