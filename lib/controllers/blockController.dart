import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/trainingController.dart';

import '../models/block.dart';

class BlockController extends ChangeNotifier {
  Box blocksBox;
  final String _blocksKey = 'blocks';
  int currentTraining;

  BlockController() {
    _loadBlocks();
  }

  _loadBlocks() async {
    blocksBox = await Hive.openBox<Block>(_blocksKey);
  }

  List<Block> getBlocks(List<int> keys) {
    return keys.map((key) => blocksBox.get(key)).toList();
  }

  Block getBlock(int key) {
    return blocksBox.get(key);
  }

  addBlock(TrainingController trainingController, String title, String desc,
      List<int> exercises) async {
    Block newBlock = Block(title, desc, exercises);
    int key = await blocksBox.add(newBlock);
    trainingController.addBlockToTraining(key, currentTraining);
    notifyListeners();
  }

  addExerciseToBlock(int exerciseKey, int blockKey) {
    Block block = blocksBox.get(blockKey);
    block.exercises = block.exercises.toList();
    block.exercises.add(exerciseKey);
    blocksBox.put(blockKey, block);
    notifyListeners();
  }

  updateBlock(int blockKey, Block block) {
    blocksBox.put(blockKey, block);
    notifyListeners();
  }

  removeBlock(BuildContext context, int key) {
    blocksBox.delete(key);
    Provider.of<TrainingController>(context, listen: false)
        .removeBlock(key, currentTraining);
    notifyListeners();
  }

  removeExercise(int exerciseKey, int blockKey) {
    Block block = blocksBox.get(blockKey);
    block.exercises.remove(exerciseKey);
    blocksBox.put(blockKey, block);
    print(blockKey);
    notifyListeners();
  }

  shuffleExercises(int blockKey) {
    Block block = blocksBox.get(blockKey);
    block.exercises.shuffle();
    blocksBox.put(blockKey, block);
    notifyListeners();
  }
}
