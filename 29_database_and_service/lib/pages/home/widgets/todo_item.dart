import 'package:flutter/material.dart';
import 'package:sqflite_setup/models/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key key, this.todo, this.onUpdate, this.onDelete}) : super(key: key);

  final Todo todo;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'name: ${todo.name}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'todo: ${todo.info}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: onUpdate,
                  child: Text('Update todo', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: onDelete,
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
