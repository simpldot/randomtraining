import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/shared/textStyles.dart';
import 'package:randomtraining/views/home/addTrainingView.dart';
import 'package:randomtraining/views/home/trainingCard.dart';
import 'package:randomtraining/views/settings/settingsView.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<int> trainingsKeys;
  TrainingController trainingController;

  @override
  Widget build(BuildContext context) {
    trainingController = Provider.of<TrainingController>(context);
    List<int> trainingsKeys = trainingController.getTrainingsOrder();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('RANDOM TRAINING', style: heading),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsView()));
            },
          ),
        ],
      ),
      body: ReorderableListView.builder(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            var item = trainingsKeys.removeAt(oldIndex);
            trainingsKeys.insert(newIndex, item);
            trainingController.updateTrainingsOrder(trainingsKeys);
          });
        },
        itemCount: trainingsKeys.length,
        itemBuilder: (context, i) => trainingCard(
            context,
            trainingController.trainingsBox.get(trainingsKeys[i]),
            trainingsKeys[i]),
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
}
