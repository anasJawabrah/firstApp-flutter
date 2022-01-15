import 'package:flutter/material.dart';
import 'dart:developer';
//Components
import 'Components/TaskCard.dart';
import './Components/Form.dart';
import './Types/note.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String pageTitle = 'My ToDo List';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
            appBar: AppBar(
              title: Text(pageTitle),
            ),
            body: TodoPage()));
  }
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  static List<Note> noteList = [];

  void handleSubmit(String title, String desc, int priority) {
    setState(() {
      noteList.add(Note(title, desc, priority));
    });
    // inspect(noteList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TodoForm(handleSubmit),
          Container(
            child: Column(
              children: noteList
                  .map((e) => TaskCard(e.taskName, e.descripton, e.priority))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
