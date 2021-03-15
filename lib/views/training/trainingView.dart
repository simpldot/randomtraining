import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/models/training.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/training/addBlockView.dart';
import 'package:randomtraining/views/training/blockCard.dart';

class TrainingView extends StatefulWidget {
  final Training training;
  final String id;
  TrainingView({Key key, @required this.training, @required this.id})
      : super(key: key);

  @override
  _TrainingViewState createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Column(
          children: [
            Hero(
              tag: widget.id + "t",
              child: Material(
                child: Text(widget.training.title, style: heading),
              ),
            ),
            Hero(
              tag: widget.id + "d",
              child: Material(
                child: Text(
                  widget.training.desc,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<TrainingController>(context, listen: false)
                    .removeTraining(
                        Provider.of<BlockController>(context, listen: false)
                            .currentTraining);
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: ReorderableListView.builder(
        padding: EdgeInsets.only(top: 8),
        onReorder: _onReorder,
        itemCount: widget.training.blocks.length,
        itemBuilder: (context, i) =>
            blockCard(context, widget.training.blocks[i]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddBlockView()));
        },
        label: Text('new Block'),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      var item = widget.training.blocks.removeAt(oldIndex);
      widget.training.blocks.insert(newIndex, item);
    });
  }
}
