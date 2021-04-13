import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/shared/textStyles.dart';

class AddTrainingView extends StatefulWidget {
  const AddTrainingView({Key key}) : super(key: key);

  @override
  _AddTrainingViewState createState() => _AddTrainingViewState();
}

class _AddTrainingViewState extends State<AddTrainingView> {
  final titleController = TextEditingController();

  final descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          title: Text('new Training', style: heading),
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
              _hiveController
                  .addTraining(titleController.text, descController.text, []);
              Navigator.pop(context);
            }
          },
          label: Text('Add Training'),
          icon: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
