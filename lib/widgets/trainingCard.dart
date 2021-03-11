import 'package:flutter/material.dart';

Widget trainingCard(BuildContext context, Map<String, String> data) {
  return Card(
    clipBehavior: Clip.antiAlias,
    key: Key(data["id"]),
    child: ListTile(
      onTap: () {},
      title: Text(data["title"]),
      subtitle: Text(data["desc"]),
    ),
  );
}
