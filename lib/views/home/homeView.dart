import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/models/training.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/home/addTrainingView.dart';
import 'package:randomtraining/views/home/trainingCard.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Training> trainings;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    trainings = Provider.of<TrainingController>(context).trainings;
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
        itemBuilder: (context, i) => trainingCard(context, trainings[i], i),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddTrainingView()));
        },
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
