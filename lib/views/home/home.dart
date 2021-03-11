import 'package:flutter/material.dart';
import 'package:randomtraining/widgets/trainingCard.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var cards = [
    {"id": "1", "title": "title1", "desc": "description 1"},
    {"id": "2", "title": "title2", "desc": "description 2"},
    {"id": "3", "title": "title3", "desc": "description 3"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'RANDOM TRAINING',
          style: TextStyle(
            fontFamily: 'SulphurPoint',
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ReorderableListView.builder(
          onReorder: _onReorder,
          itemCount: cards.length,
          itemBuilder: (context, i) => trainingCard(context, cards[i])),
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
      var item = cards.removeAt(oldIndex);
      cards.insert(newIndex, item);
    });
  }
}
