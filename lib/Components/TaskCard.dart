import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String? name;
  final String? desc;
  final int? priority;
  TaskCard(this.name, this.desc, this.priority);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: [
            Text(name as String),
            Text(desc as String),
            Text(priority.toString())
          ],
        ),
      ),
    );
  }
}
