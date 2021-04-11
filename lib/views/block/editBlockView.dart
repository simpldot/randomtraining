import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomtraining/controllers/blockController.dart';
import 'package:randomtraining/controllers/exerciseController.dart';
import 'package:randomtraining/controllers/trainingController.dart';
import 'package:randomtraining/models/block.dart';
import 'package:randomtraining/shared/textStyles.dart';

class EditBlockView extends StatefulWidget {
  final int id;
  final Block block;
  final TrainingController trainingController;
  const EditBlockView(
      {Key key,
      @required this.id,
      @required this.block,
      @required this.trainingController})
      : super(key: key);

  @override
  _EditBlockViewState createState() => _EditBlockViewState(block);
}

class _EditBlockViewState extends State<EditBlockView> {
  TextEditingController titleController;
  TextEditingController descController;

  Block block;

  final _formKey = GlobalKey<FormState>();

  _EditBlockViewState(Block block) {
    this.block = block;
    titleController = TextEditingController(text: block.title);
    descController = TextEditingController(text: block.desc);
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlockController _blockController = Provider.of<BlockController>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('edit Block', style: heading),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<BlockController>(context, listen: false)
                      .removeBlock(
                          context,
                          Provider.of<ExerciseController>(context,
                                  listen: false)
                              .currentBlock);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Exercise deleted"),
                      action: SnackBarAction(
                          label: "UNDO",
                          textColor: Theme.of(context).accentColor,
                          onPressed: () {
                            _blockController.addBlock(widget.trainingController,
                                block.title, block.desc, block.exercises);
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
              block.title = titleController.text;
              block.desc = descController.text;
              _blockController.updateBlock(widget.id, block);
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
