import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/training.dart';

class TrainingController extends ChangeNotifier {
  Box trainingsBox;
  Box settingsBox;
  final String _trainingsKey = 'trainings';
  final String _trainingsOrderKey = 'trainings-order';

  TrainingController() {
    _loadTrainings();
  }

  _loadTrainings() async {
    trainingsBox = await Hive.openBox<Training>(_trainingsKey);
    settingsBox = await Hive.openBox('settings');
  }

  List<int> getTrainingsOrder() {
    List<int> trainingsOrder = settingsBox.get(_trainingsOrderKey) ?? [];
    return trainingsOrder.toList();
  }

  addTraining(String title, String desc, List<int> blocks) async {
    Training newTraining = Training(title, desc, blocks);
    int key = await trainingsBox.add(newTraining);
    List<int> trainingsOrder = getTrainingsOrder();
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
    List<int> trainingsOrder = getTrainingsOrder();
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
