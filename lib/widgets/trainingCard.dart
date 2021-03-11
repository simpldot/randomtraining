import 'package:flutter/material.dart';
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
        title: Text(data["title"]),
        subtitle: Text(data["desc"]),
        trailing: Icon(Icons.drag_handle_rounded),
      ),
    ),
  );
}
