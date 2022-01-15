import 'package:flutter/material.dart';
import 'dart:developer';
//Components
import '../Components/TaskCard.dart';
import '../Components/Form.dart';
import '../Types/note.dart';

class TodoFormPage extends StatelessWidget {
  final String pageTitle = 'My ToDo List';

  @override
  Widget build(BuildContext context) {
    void goToLocationPage() {
      Navigator.pushNamed(context, '/location');
    }

    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
          appBar: AppBar(
            title: Text(pageTitle),
          ),
          body: TodoPage(goToLocationPage),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/location');
          //   },
          // ),
        ));
  }
}

class TodoPage extends StatefulWidget {
  Function goToLocationPage;
  TodoPage(this.goToLocationPage);
  @override
  _TodoPageState createState() => _TodoPageState(goToLocationPage);
}

class _TodoPageState extends State<TodoPage> {
  Function goToLocationPage;
  _TodoPageState(this.goToLocationPage);
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
          ),
          ElevatedButton(
              onPressed: () => goToLocationPage(), child: Text("go home "))
        ],
      ),
    );
  }
}
