import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_setup/database/database_creator.dart';
import 'package:sqflite_setup/database/database_tables.dart';

class SqfliteDatabaseCreator extends DatabaseCreator<Database> {
  String _databaseName = "todo_db";

  DatabaseTables _dbTables;
  SqfliteDatabaseCreator(DatabaseTables dbTables) {
    _dbTables = dbTables;
  }

  @override
  Future<Database> initDatabase() async {
    String databasesPath = await _getMyDatabasePath(_databaseName);

    Database database = await openDatabase(databasesPath, version: 1, onCreate: _onCreate);
    return database;
  }

  Future<String> _getMyDatabasePath(String databaseName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    if (await Directory(dirname(path)).exists()) {
      // If you want to delete the database on startup you can uncomment this:
      await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(_dbTables.todoTable);
  }
}
