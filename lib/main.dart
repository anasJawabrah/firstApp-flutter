import 'package:flutter/material.dart';
//Pages
import './Pages/Todo.dart';
import './Pages/Home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/location',
      routes: {
        '/': (context) => TodoFormPage(),
        '/location': (context) => HomeApp()
      },
    ));
