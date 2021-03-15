import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/trainingController.dart';

import '../models/block.dart';

class BlockController extends ChangeNotifier {
  Box blocksBox;
  final String _blocksKey = 'blocks';
  List<Block> _blocks;
  int currentTraining;

  BlockController() {
    _loadBlocks();
  }

  _loadBlocks() async {
    blocksBox = await Hive.openBox<Block>(_blocksKey);
    _blocks = blocksBox.values.toList();
    print(_blocks);
  }

  List<Block> get blocks => _blocks;

  List<Block> getBlocks(List<int> keys) {
    return keys.map((key) => blocksBox.get(key)).toList();
  }

  Block getBlock(int key) {
    return blocksBox.get(key);
  }

  addBlock(BuildContext context, String title, String desc) async {
    Block newBlock = Block(title, desc);
    _blocks.add(newBlock);
    int key = await blocksBox.add(newBlock);
    Provider.of<TrainingController>(context, listen: false)
        .updateTraining(key, currentTraining);
    notifyListeners();
  }
}
