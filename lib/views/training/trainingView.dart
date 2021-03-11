import 'package:flutter/material.dart';
import 'package:randomtraining/shared/textStyles.dart';

class TrainingView extends StatefulWidget {
  final String id;
  TrainingView({Key key, @required this.id}) : super(key: key);

  @override
  _TrainingViewState createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  var cards = {
    "1": {"title": "title1", "desc": "description 1"},
    "2": {"title": "title2", "desc": "description 2"},
    "3": {"title": "title3", "desc": "description 3"}
  };
  var training;
  @override
  void initState() {
    super.initState();
    training = cards[widget.id];
  }

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
              tag: training["title"],
              child: Material(
                child: Text(training["title"], style: heading),
              ),
            ),
            Hero(
              tag: training["desc"],
              child: Material(
                child: Text(
                  training["desc"],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('new Block'),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
