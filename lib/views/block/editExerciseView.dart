import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/exerciseController.dart';
import 'package:randomtraining/models/exercise.dart';
import 'package:randomtraining/shared/textStyles.dart';

class EditExerciseView extends StatefulWidget {
  final Exercise exercise;
  final int exerciseId;
  const EditExerciseView(
      {Key key, @required this.exercise, @required this.exerciseId})
      : super(key: key);

  @override
  _EditExerciseViewState createState() => _EditExerciseViewState(exercise);
}

class _EditExerciseViewState extends State<EditExerciseView> {
  TextEditingController titleController;
  TextEditingController descController;

  Exercise exercise;

  final _formKey = GlobalKey<FormState>();

  _EditExerciseViewState(Exercise exercise) {
    this.exercise = exercise;
    titleController = TextEditingController(text: exercise.title);
    descController = TextEditingController(text: exercise.desc);
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ExerciseController _exerciseController =
        Provider.of<ExerciseController>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('edit Exercise', style: heading),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<ExerciseController>(context, listen: false)
                      .removeExercise(context, widget.exerciseId);
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
              exercise.title = titleController.text;
              exercise.desc = descController.text;
              _exerciseController.updateExercise(widget.exerciseId, exercise);
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
