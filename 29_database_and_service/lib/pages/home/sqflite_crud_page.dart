import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_setup/models/todo.dart';
import 'package:sqflite_setup/pages/home/widgets/todo_item.dart';
import 'package:sqflite_setup/services/todo_service.dart';

class SqfliteCrud extends StatefulWidget {
  SqfliteCrud({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SqfliteCrudState createState() => _SqfliteCrudState();
}

class _SqfliteCrudState extends State<SqfliteCrud> {
  final _formKey = GlobalKey<FormState>();
  TodoService _todoService;
  Future<List<Todo>> future;
  String name;
  int id;

  @override
  initState() {
    super.initState();
    _todoService = Provider.of<TodoService>(context, listen: false);
    future = _todoService.getAllTodos();
  }

  void readData() async {
    final todo = await _todoService.getTodo(id);
    print(todo.name);
  }

  void updateTodo(Todo todo) async {
    todo.name = 'please 🤫';
    await _todoService.updateTodo(todo);
    setState(() {
      future = _todoService.getAllTodos();
    });
  }

  void deleteTodo(Todo todo) async {
    await _todoService.deleteTodo(todo);
    setState(() {
      id = null;
      future = _todoService.getAllTodos();
    });
  }

  void createTodo() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Todo todo = Todo(name, randomTodo(), false);
      todo.id = await _todoService.addTodo(todo);
      setState(() {
        id = todo.id;
        future = _todoService.getAllTodos();
      });
    }
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'name',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: (value) => name = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: createTodo,
                child: Text('Create', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Read', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
            ],
          ),
          FutureBuilder<List<Todo>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final todoList = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoList[index];
                    return TodoCard(
                      todo: todo,
                      onDelete: () => deleteTodo(todo),
                      onUpdate: () => updateTodo(todo),
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }

  String randomTodo() {
    final randomNumber = Random().nextInt(4);
    String todo;
    switch (randomNumber) {
      case 1:
        todo = 'Like and subscribe 💩';
        break;
      case 2:
        todo = 'Twitter @robertbrunhage 🤣';
        break;
      case 3:
        todo = 'Patreon in the description 🤗';
        break;
      default:
        todo = 'Leave a comment 🤓';
        break;
    }
    return todo;
  }
}
