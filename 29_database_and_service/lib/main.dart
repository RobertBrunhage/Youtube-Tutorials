import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_setup/database/sqflite/sqflite_database_creator.dart';
import 'package:sqflite_setup/database/sqflite/sqflite_database_tables.dart';
import 'package:sqflite_setup/pages/home/sqflite_crud_page.dart';
import 'package:sqflite_setup/services/sqflite_services/sqflite_todo_service.dart';
import 'package:sqflite_setup/services/todo_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database database = await SqfliteDatabaseCreator(SqfliteDatabaseTables()).initDatabase();
  runApp(MyApp(database));
}

class MyApp extends StatelessWidget {
  final Database _database;
  MyApp(this._database);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TodoService>(
          create: (context) => SqfliteTodoService(_database),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SqfliteCrud(title: 'sqflite'),
      ),
    );
  }
}
