import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/training.dart';

class TrainingController extends ChangeNotifier {
  Box trainingsBox;
  final String _trainingsKey = 'trainings';

  TrainingController() {
    _loadTrainings();
  }

  _loadTrainings() async {
    trainingsBox = await Hive.openBox<Training>(_trainingsKey);
  }

  addTraining(String title, String desc) {
    Training newTraining = Training(title, desc);
    trainingsBox.add(newTraining);
    notifyListeners();
  }

  removeTraining(int key) {
    trainingsBox.delete(key);
    print(key);
    print(trainingsBox.values.toList());
    print(trainingsBox.keys.toList());
    notifyListeners();
  }

  deleteAll() {
    trainingsBox.deleteAll(trainingsBox.keys);
  }

  updateTraining(int blockKey, int trainingKey) {
    Training training = trainingsBox.get(trainingKey);
    training.blocks.toList().add(blockKey);
    trainingsBox.put(trainingKey, training);
    notifyListeners();
  }
}
