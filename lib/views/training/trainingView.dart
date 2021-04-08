import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/models/training.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/training/addBlockView.dart';
import 'package:randomtraining/views/training/blockCard.dart';
import 'package:randomtraining/views/training/editTrainingView.dart';

class TrainingView extends StatefulWidget {
  final int trainingKey;
  final String id;
  TrainingView({Key key, @required this.trainingKey, @required this.id})
      : super(key: key);

  @override
  _TrainingViewState createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  Training training;
  List<int> blocks;
  @override
  Widget build(BuildContext context) {
    training = Provider.of<TrainingController>(context)
        .trainingsBox
        .get(widget.trainingKey);
    blocks = training.blocks.toList();
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
                child: Text(training.title, style: heading),
              ),
            ),
            Hero(
              tag: widget.id + "d",
              child: Material(
                child: Text(
                  training.desc,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditTrainingView(
                            id: widget.trainingKey, training: training)));
              }),
        ],
      ),
      body: ReorderableListView.builder(
        padding: EdgeInsets.only(top: 8),
        onReorder: _onReorder,
        itemCount: blocks.length,
        itemBuilder: (context, i) => blockCard(context, blocks[i]),
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
      var item = blocks.removeAt(oldIndex);
      blocks.insert(newIndex, item);
      training.blocks = blocks;
      Provider.of<TrainingController>(context, listen: false)
          .updateTraining(widget.trainingKey, training);
    });
  }
}
