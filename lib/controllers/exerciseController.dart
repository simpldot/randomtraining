import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/models/exercise.dart';

class ExerciseController extends ChangeNotifier {
  final String _exercisesKey = 'exercises';

  int currentBlock;
  Box exerciseBox;

  ExerciseController() {
    _loadExercises();
  }

  _loadExercises() async {
    exerciseBox = await Hive.openBox(_exercisesKey);
  }

  Exercise getExercise(int key) {
    return exerciseBox.get(key);
  }

  addExercise(
      BlockController blockController, String title, String desc) async {
    Exercise newExercise = Exercise(title, desc);
    int key = await exerciseBox.add(newExercise);
    blockController.addExerciseToBlock(key, currentBlock);
  }

  removeExercise(BuildContext context, int key) {
    exerciseBox.delete(key);
    Provider.of<BlockController>(context, listen: false)
        .removeExercise(key, currentBlock);
  }

  void updateExercise(int exerciseId, Exercise exercise) {
    exerciseBox.put(exerciseId, exercise);
    notifyListeners();
  }
}
