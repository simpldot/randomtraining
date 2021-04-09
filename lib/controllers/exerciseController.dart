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

  addExercise(BuildContext context, String title, String desc) async {
    Exercise newExercise = Exercise(title, desc);
    int key = await exerciseBox.add(newExercise);
    Provider.of<BlockController>(context, listen: false)
        .addExerciseToBlock(key, currentBlock);
  }

  removeExercise(BuildContext context, int key) {
    exerciseBox.delete(key);
    Provider.of<BlockController>(context, listen: false)
        .removeExercise(key, currentBlock);
  }
}
