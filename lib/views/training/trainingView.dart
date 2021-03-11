import 'package:flutter/material.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/training/blockCard.dart';

class TrainingView extends StatefulWidget {
  final String id;
  TrainingView({Key key, @required this.id}) : super(key: key);

  @override
  _TrainingViewState createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  var data = {
    "tr-1": {"title": "training 1", "desc": "description 1"},
    "tr-2": {"title": "training 2", "desc": "description 2"},
    "tr-3": {"title": "training 3", "desc": "description 3"}
  };
  var training;
  @override
  void initState() {
    super.initState();
    training = data[widget.id];
  }

  var blocks = [
    {"id": "bl-1", "title": "block 1", "desc": "description 1"},
    {"id": "bl-2", "title": "block 2", "desc": "description 2"},
    {"id": "bl-3", "title": "block 3", "desc": "description 3"}
  ];

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
                child: Text(training["title"], style: heading),
              ),
            ),
            Hero(
              tag: widget.id + "d",
              child: Material(
                child: Text(
                  training["desc"],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
      ),
      body: ReorderableListView.builder(
        padding: EdgeInsets.only(top: 8),
        onReorder: _onReorder,
        itemCount: blocks.length,
        itemBuilder: (context, i) => blockCard(context, blocks[i]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
    });
  }
}
