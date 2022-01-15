import 'package:flutter/material.dart';

//Components

class HomeApp extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location'))
        ],
      )),
    );
  }
}
