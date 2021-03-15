import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/models/training.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/training/trainingView.dart';

Widget trainingCard(BuildContext context, Training training, int id) {
  String idString = "tr-" + id.toString();
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    key: Key(idString),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {
          Provider.of<BlockController>(context, listen: false).currentTraining =
              id;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  TrainingView(training: training, id: idString)));
        },
        title: Hero(
            tag: idString + "t",
            child: Material(child: Text(training.title, style: smallHeading))),
        subtitle: Hero(
            tag: idString + "d", child: Material(child: Text(training.desc))),
        trailing: Icon(Icons.drag_handle_rounded),
      ),
    ),
  );
}
