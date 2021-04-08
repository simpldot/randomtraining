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

  addBlock(BuildContext context, String title, String desc) async {
    Block newBlock = Block(title, desc, []);
    int key = await blocksBox.add(newBlock);
    Provider.of<TrainingController>(context, listen: false)
        .addBlockToTraining(key, currentTraining);
    notifyListeners();
  }

  updateBlock(int exerciseKey, int blockKey) {
    Block block = blocksBox.get(blockKey);
    block.exercises.add(exerciseKey);
    blocksBox.put(blockKey, block);
    notifyListeners();
  }

  removeBlock(BuildContext context, int key) {
    blocksBox.delete(key);
    Provider.of<TrainingController>(context, listen: false)
        .removeBlock(key, currentTraining);
    notifyListeners();
  }

  shuffleExercises(int blockKey) {
    Block block = blocksBox.get(blockKey);
    block.exercises.shuffle();
    blocksBox.put(blockKey, block);
    notifyListeners();
  }
}
