import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/training.dart';

class TrainingController extends ChangeNotifier {
  Box trainingsBox;
  Box settingsBox;
  final String _trainingsKey = 'trainings';
  final String _trainingsOrderKey = 'trainings-order';

  List<int> trainingsOrder;

  TrainingController() {
    _loadTrainings();
  }

  _loadTrainings() async {
    trainingsBox = await Hive.openBox<Training>(_trainingsKey);
    settingsBox = await Hive.openBox('settings');
    trainingsOrder = settingsBox.get(_trainingsOrderKey) ?? [];
    trainingsOrder.toList();
  }

  List<int> getTrainingsOrder() {
    return trainingsOrder;
  }

  addTraining(String title, String desc) async {
    Training newTraining = Training(title, desc, []);
    int key = await trainingsBox.add(newTraining);
    trainingsOrder.add(key);
    settingsBox.put(_trainingsOrderKey, trainingsOrder);
    notifyListeners();
  }

  updateTrainingsOrder(List<int> newTrainingsOrder) {
    settingsBox.put(_trainingsOrderKey, newTrainingsOrder);
    notifyListeners();
  }

  removeTraining(int key) {
    trainingsBox.delete(key);
    trainingsOrder.remove(key);
    settingsBox.put(_trainingsOrderKey, trainingsOrder);
    notifyListeners();
  }

  addBlockToTraining(int blockKey, int trainingKey) {
    Training training = trainingsBox.get(trainingKey);
    // convert to non fixed list
    training.blocks = training.blocks.toList();
    training.blocks.add(blockKey);
    trainingsBox.put(trainingKey, training);
    notifyListeners();
  }

  updateTraining(int trainingKey, Training training) {
    trainingsBox.put(trainingKey, training);
    notifyListeners();
  }

  removeBlock(int blockKey, int trainingKey) {
    Training training = trainingsBox.get(trainingKey);
    // convert to non fixed list
    training.blocks = training.blocks.toList();
    training.blocks.remove(blockKey);
    trainingsBox.put(trainingKey, training);
    notifyListeners();
  }
}
