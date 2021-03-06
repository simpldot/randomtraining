import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/controllers/exerciseController.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/models/block.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/block/blockView.dart';

Widget blockCard(BuildContext context, int id) {
  String idString = "bl-" + id.toString();
  BlockController blockController = Provider.of<BlockController>(context);
  Block block = blockController.getBlock(id);
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    key: Key(idString),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {
          Provider.of<ExerciseController>(context, listen: false).currentBlock =
              id;
          blockController.shuffleExercises(id);
          TrainingController trainingController =
              Provider.of<TrainingController>(context, listen: false);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => BlockView(
                    blockKey: id,
                    id: idString,
                    trainingController: trainingController,
                  )));
        },
        title: Hero(
            tag: idString + "t",
            child: Material(child: Text(block.title, style: smallHeading))),
        subtitle:
            Hero(tag: idString + "d", child: Material(child: Text(block.desc))),
        trailing: Icon(Icons.drag_handle_rounded),
      ),
    ),
  );
}
