import 'package:sqflite/sqflite.dart';
import 'package:sqflite_setup/database/sqflite/sqflite_database_tables.dart';
import 'package:sqflite_setup/database/sqflite/utils/sqflite_database_logger.dart';
import 'package:sqflite_setup/models/todo.dart';
import 'package:sqflite_setup/services/todo_service.dart';

class SqfliteTodoService extends TodoService {
  Database _database;
  SqfliteDatabaseLogger sqfliteLogger = SqfliteDatabaseLogger();
  SqfliteTodoService(this._database);

  @override
  Future<List<Todo>> getAllTodos() async {
    final sql = '''SELECT * FROM ${SqfliteDatabaseTables.todoTableName}
    WHERE ${Todo.isDeletedField} = 0''';
    final data = await _database.rawQuery(sql);

    List<Todo> todos = data.map((todoJson) => Todo.fromJson(todoJson)).toList();
    return todos;
  }

  @override
  Future<Todo> getTodo(int id) async {
    final sql = '''SELECT * FROM ${SqfliteDatabaseTables.todoTableName}
    WHERE ${Todo.idField} = ?''';

    List<dynamic> params = [id];
    final data = await _database.rawQuery(sql, params);

    final todo = Todo.fromJson(data.first);
    return todo;
  }

  @override
  Future<int> addTodo(Todo todo) async {
    final sql = '''INSERT INTO ${SqfliteDatabaseTables.todoTableName}
    (
      ${Todo.idField},
      ${Todo.nameField},
      ${Todo.infoField},
      ${Todo.isDeletedField}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [todo.id, todo.name, todo.info, todo.isDeleted ? 1 : 0];
    final result = await _database.rawInsert(sql, params);
    sqfliteLogger.log('Update todo', sql, null, result, params);
    return result;
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final sql = '''UPDATE ${SqfliteDatabaseTables.todoTableName}
    SET ${Todo.nameField} = ?
    WHERE ${Todo.idField} = ?
    ''';

    List<dynamic> params = [todo.name, todo.id];
    final result = await _database.rawUpdate(sql, params);

    sqfliteLogger.log('Update todo', sql, null, result, params);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final sql = '''UPDATE ${SqfliteDatabaseTables.todoTableName}
    SET ${Todo.isDeletedField} = 1
    WHERE ${Todo.idField} = ?
    ''';

    List<dynamic> params = [todo.id];
    final result = await _database.rawUpdate(sql, params);

    sqfliteLogger.log('Delete todo', sql, null, result, params);
  }
}
