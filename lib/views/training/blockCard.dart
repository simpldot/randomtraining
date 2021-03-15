import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/models/block.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/block/blockView.dart';

Widget blockCard(BuildContext context, int id) {
  String idString = "bl-" + id.toString();
  Block block = Provider.of<BlockController>(context).getBlock(id);
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    key: Key(idString),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => BlockView(id: idString)));
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
