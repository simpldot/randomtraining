import 'package:flutter/material.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/training/trainingView.dart';

Widget trainingCard(BuildContext context, Map<String, String> data) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    key: Key(data["id"]),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => TrainingView(id: data["id"])));
        },
        title: Hero(
            tag: data["title"],
            child: Material(child: Text(data["title"], style: smallHeading))),
        subtitle:
            Hero(tag: data["desc"], child: Material(child: Text(data["desc"]))),
        trailing: Icon(Icons.drag_handle_rounded),
      ),
    ),
  );
}
