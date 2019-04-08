import 'package:sqflite_crud/models/todo.dart';
import 'package:sqflite_crud/repository/database_creator.dart';

class RepositoryServiceTodo {
  static Future<List<Todo>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.isDeleted} == 0''';
    final data = await db.rawQuery(sql);
    List<Todo> todos = List();

    for (final node in data) {
      final todo = Todo.fromJson(node);
      todos.add(todo);
    }
    return todos;
  }

  static Future<Todo> getTodo(int id) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.id} == $id''';
    final data = await db.rawQuery(sql);

    final todo = Todo.fromJson(data[0]);
    return todo;
  }

  static Future<void> addTodo(Todo todo) async {
    final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.isDeleted}
    )
    VALUES 
    (
      ${todo.id},
      "${todo.name}",
      "${todo.info}",
      ${todo.isDeleted ? 1 : 0}
    )''';

    final result = await db.rawInsert(sql);
    DatabaseCreator.databaseLog('Add todo', sql, null, result);
  }

  static Future<void> deleteTodo(Todo todo) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} == ${todo.id}
    ''';

    final result = await db.rawUpdate(sql);

    DatabaseCreator.databaseLog('Delete todo', sql, null, result);
  }

  static Future<void> updateTodo(Todo todo) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.name} = "${todo.name}"
    WHERE ${DatabaseCreator.id} == ${todo.id}
    ''';

    final result = await db.rawUpdate(sql);

    DatabaseCreator.databaseLog('Update todo', sql, null, result);
  }

  static Future<int> todosCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.todoTable}''');

    int count = data[0].values.elementAt(0);
    return count;
  }
}
