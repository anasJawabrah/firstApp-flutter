import 'dart:developer';

import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final Function handleSubmit;

  TodoForm(this.handleSubmit);

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final String taskName = 'Task Name ';
  final String taskPriority = 'Task Priority';
  final String description = 'Description';
  final String submitText = 'submit';

  final taskNameController = TextEditingController();
  final taskDescController = TextEditingController();
  final taskPriorityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //TODO: handle reset case
  void handleAddNewNote() {
    widget.handleSubmit(taskNameController.text, taskDescController.text,
        int.parse(taskPriorityController.text));
    taskNameController.clear();
    taskDescController.clear();
    taskPriorityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
        width: double.infinity,
        height: 320,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextField(
                    // onChanged: (e) => handleChange(e, 'title'),
                    controller: taskNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: taskName,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2))),
                  ),
                  TextField(
                    controller: taskDescController,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: InputDecoration(
                        labelText: description,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 32))),
                  ),
                  TextField(
                    controller: taskPriorityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: taskPriority,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        onPressed: () => handleAddNewNote(),
                        child: Text(submitText)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
