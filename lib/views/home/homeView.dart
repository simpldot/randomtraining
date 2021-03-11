import 'package:flutter/material.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/home/trainingCard.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var trainings = [
    {"id": "tr-1", "title": "training 1", "desc": "description 1"},
    {"id": "tr-2", "title": "training 2", "desc": "description 2"},
    {"id": "tr-3", "title": "training 3", "desc": "description 3"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('RANDOM TRAINING', style: heading),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ReorderableListView.builder(
        onReorder: _onReorder,
        itemCount: trainings.length,
        itemBuilder: (context, i) => trainingCard(context, trainings[i]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('new Training'),
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
      var item = trainings.removeAt(oldIndex);
      trainings.insert(newIndex, item);
    });
  }
}
