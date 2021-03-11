import 'package:flutter/material.dart';

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
        title: Text(
          training["title"],
          style: TextStyle(
            fontFamily: 'SulphurPoint',
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
