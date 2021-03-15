import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/block.dart';
import 'package:randomtraining/models/training.dart';

class BlockController extends ChangeNotifier {
  Box blocksBox;
  final String _blocksKey = 'blocks';
  List<Block> _blocks;
  Training currentTraining;

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

  addBlock(String title, String desc) {
    Block newBlock = Block(title, desc);
    _blocks.add(newBlock);
    blocksBox.add(newBlock);
    notifyListeners();
  }
}
