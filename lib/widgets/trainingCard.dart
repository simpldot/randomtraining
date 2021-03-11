import 'package:flutter/material.dart';

Widget trainingCard(BuildContext context, Map<String, String> data) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    key: Key(data["id"]),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {},
        title: Text(data["title"]),
        subtitle: Text(data["desc"]),
        trailing: Icon(Icons.drag_handle_rounded),
      ),
    ),
  );
}
