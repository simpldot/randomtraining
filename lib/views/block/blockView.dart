import 'package:flutter/material.dart';
import 'package:randomtraining/shared/textStyles.dart';

class BlockView extends StatefulWidget {
  final String id;
  BlockView({Key key, @required this.id}) : super(key: key);

  @override
  _BlockViewState createState() => _BlockViewState();
}

class _BlockViewState extends State<BlockView> {
  var data = {
    "bl-1": {"title": "block 1", "desc": "description 1"},
    "bl-2": {"title": "block 2", "desc": "description 2"},
    "bl-3": {"title": "block 3", "desc": "description 3"}
  };
  var training;

  var focusItem = 0;

  var exercises = [
    {
      "id": "ex-1",
      "title": "exercise 1",
      "desc": "description 1",
      "checked": false
    },
    {
      "id": "ex-2",
      "title": "exercise 2",
      "desc": "description 2",
      "checked": false
    },
    {
      "id": "ex-3",
      "title": "exercise 3",
      "desc": "description 3",
      "checked": false
    }
  ];

  @override
  void initState() {
    super.initState();
    training = data[widget.id];
    exercises.shuffle();
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
        actions: [
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 8),
          itemCount: exercises.length,
          itemBuilder: (context, i) => Padding(
                padding: i == focusItem
                    ? EdgeInsets.fromLTRB(8, 0, 8, 0)
                    : EdgeInsets.fromLTRB(28, 0, 28, 0),
                key: Key(exercises[i]["id"]),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: CheckboxListTile(
                      title: Text(exercises[i]["title"], style: smallHeading),
                      subtitle: Text(exercises[i]["desc"]),
                      value: exercises[i]["checked"],
                      onChanged: (newValue) {
                        setState(() {
                          exercises[i]["checked"] = newValue;
                        });
                        _setFocusItem();
                      }),
                ),
              )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('new Exercise'),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _setFocusItem() {
    setState(() {
      this.focusItem = exercises
          .map((exercise) => exercise["checked"])
          .toList()
          .indexOf(false);
    });
  }
}
