import 'package:firestore_crud/bloc_provider.dart';
import 'package:firestore_crud/src/home/home.dart';
import 'package:firestore_crud/src/home/home_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: HomeBloc(),
        child: FirestoreCRUDPage(),
      ),
    );
  }
}
