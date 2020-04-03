import 'package:sqflite_setup/database/database_tables.dart';
import 'package:sqflite_setup/models/todo.dart';

class SqfliteDatabaseTables implements DatabaseTables {
  static const todoTableName = 'todo';

  String get todoTable {
    final todoSql = '''CREATE TABLE $todoTableName
    (
      ${Todo.idField} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Todo.nameField} TEXT,
      ${Todo.infoField} TEXT,
      ${Todo.isDeletedField} BIT NOT NULL
    )''';

    return todoSql;
  }
}
