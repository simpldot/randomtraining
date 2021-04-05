import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/shared/textStyles.dart';

class EditTrainingView extends StatefulWidget {
  final int id;
  const EditTrainingView({Key key, @required this.id}) : super(key: key);

  @override
  _EditTrainingViewState createState() => _EditTrainingViewState();
}

class _EditTrainingViewState extends State<EditTrainingView> {
  final titleController = TextEditingController();

  final descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TrainingController _hiveController =
        Provider.of<TrainingController>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('edit raining', style: heading),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<TrainingController>(context, listen: false)
                      .removeTraining(
                          Provider.of<BlockController>(context, listen: false)
                              .currentTraining);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a Title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _hiveController.addTraining(
                  titleController.text, descController.text);
              Navigator.pop(context);
            }
          },
          label: Text('Save'),
          icon: Icon(Icons.save),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
