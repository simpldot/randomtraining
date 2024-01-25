import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/models/training.dart';
import 'package:randomtraining/shared/textStyles.dart';

class EditTrainingView extends StatefulWidget {
  final int id;
  final Training training;
  const EditTrainingView({Key key, required this.id, required this.training})
      : super(key: key);

  @override
  _EditTrainingViewState createState() => _EditTrainingViewState(training);
}

class _EditTrainingViewState extends State<EditTrainingView> {
  TextEditingController titleController;
  TextEditingController descController;

  Training training;

  final _formKey = GlobalKey<FormState>();

  _EditTrainingViewState(Training training) {
    this.training = training;
    titleController = TextEditingController(text: training.title);
    descController = TextEditingController(text: training.desc);
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TrainingController _trainingController =
        Provider.of<TrainingController>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('edit Training', style: heading),
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Training deleted"),
                      action: SnackBarAction(
                          label: "UNDO",
                          textColor: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            _trainingController.addTraining(
                                training.title, training.desc, training.blocks);
                          })));
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
              training.title = titleController.text;
              training.desc = descController.text;
              _trainingController.updateTraining(widget.id, training);
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
