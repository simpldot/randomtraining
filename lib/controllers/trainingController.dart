import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/training.dart';

class TrainingController extends ChangeNotifier {
  Box trainingsBox;
  final String _trainingsKey = 'trainings';
  List<Training> _trainings;

  TrainingController() {
    _loadTrainings();
  }

  _loadTrainings() async {
    trainingsBox = await Hive.openBox<Training>(_trainingsKey);
    _trainings = trainingsBox.values.toList();
    print(_trainings);
  }

  List<Training> get trainings => _trainings;

  addTraining(String title, String desc) {
    Training newTraining = Training(title, desc);
    _trainings.add(newTraining);
    trainingsBox.add(newTraining);
    notifyListeners();
  }
}
