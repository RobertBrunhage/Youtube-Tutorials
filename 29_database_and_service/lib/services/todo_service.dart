import 'package:sqflite_setup/models/todo.dart';

abstract class TodoService {
  Future<List<Todo>> getAllTodos();
  Future<Todo> getTodo(int id);
  Future<int> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
}
