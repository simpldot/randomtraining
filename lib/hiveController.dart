import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/block.dart';
import 'models/training.dart';

class HiveController extends ChangeNotifier {
  Box trainingsBox;
  final String _trainingsKey = 'trainings';
  List<Training> _trainings;
  Training currentTraining;

  HiveController(trainingsBox) {
    this.trainingsBox = trainingsBox;
    _trainings = trainingsBox.containsKey(_trainingsKey)
        ? trainingsBox.get(_trainingsKey)
        : [];
    print(_trainings);
  }

  List<Training> get trainings => _trainings;

  addTraining(String title, String desc) {
    Training newTraining = Training(title, desc, []);
    _trainings.add(newTraining);
    trainingsBox.add(newTraining);
    notifyListeners();
  }

  addBlock(String title, String desc) {
    currentTraining.blocks.add(Block(title, desc, []));
    notifyListeners();
  }
}
