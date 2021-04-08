import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/controllers/exerciseController.dart';
import 'package:randomtraining/models/block.dart';
import 'package:randomtraining/models/exercise.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/block/addExerciseView.dart';
import 'package:randomtraining/views/block/editBlockView.dart';

class BlockView extends StatefulWidget {
  final int blockKey;
  final String id;
  BlockView({Key key, @required this.blockKey, @required this.id})
      : super(key: key);

  @override
  _BlockViewState createState() => _BlockViewState();
}

class _BlockViewState extends State<BlockView> {
  int focusItem;

  Block block;
  List<int> exercises;
  List<int> checkedList = [];

  @override
  Widget build(BuildContext context) {
    block =
        Provider.of<BlockController>(context).blocksBox.get(widget.blockKey);
    exercises = block.exercises.toList();
    _setFocusItem();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Column(
          children: [
            Hero(
              tag: block.title,
              child: Material(
                child: Text(block.title, style: heading),
              ),
            ),
            Hero(
              tag: block.desc,
              child: Material(
                child: Text(
                  block.desc,
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
                        builder: (context) =>
                            EditBlockView(id: widget.blockKey, block: block)));
              }),
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 8),
          itemCount: exercises.length,
          itemBuilder: (context, i) {
            Exercise exercise = Provider.of<ExerciseController>(context)
                .getExercise(exercises[i]);
            return Dismissible(
              key: Key(i.toString()),
              child: Padding(
                padding: exercises[i] == focusItem
                    ? EdgeInsets.fromLTRB(8, 0, 8, 0)
                    : EdgeInsets.fromLTRB(28, 0, 28, 0),
                key: Key(i.toString()),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: CheckboxListTile(
                      title: Text(exercise.title, style: smallHeading),
                      subtitle: Text(exercise.desc),
                      value: checkedList.contains(exercises[i]),
                      onChanged: (newValue) {
                        setState(() {
                          if (newValue) {
                            checkedList.add(exercises[i]);
                          } else {
                            checkedList.remove(exercises[i]);
                          }
                        });
                        _setFocusItem();
                        print(checkedList);
                      }),
                ),
              ),
              background: Container(
                child: Icon(Icons.edit),
              ),
              onDismissed: (direction) {
                var item = exercises.elementAt(i);
                setState(() {
                  exercises.removeAt(i);
                });
                //_deleteExercise(i);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Exercise deleted"),
                    action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () {
                          _undoDeletion(i, item);
                        })));
              },
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddExerciseView()));
        },
        label: Text('new Exercise'),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _setFocusItem() {
    setState(() {
      this.focusItem = exercises.firstWhere(
          (element) => !checkedList.contains(element),
          orElse: () => -1);
    });
  }

  void _deleteExercise(index) {
    setState(() {
      exercises.removeAt(index);
    });
  }

  void _undoDeletion(index, exercise) {
    setState(() {
      exercises.insert(index, exercise);
    });
  }
}
