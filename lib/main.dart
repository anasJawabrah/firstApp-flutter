import 'package:flutter/material.dart';
import './Components/Form.dart';
import './Types/note.dart';
import 'dart:developer';

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
  int counter = 0;

  static List<Note> noteList = [];

  void handleSubmit(String title, String desc, int priority) {
    noteList.add(Note(title, desc, priority));
    inspect(noteList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TodoForm(handleSubmit),
        ],
      ),
    );
  }
}
