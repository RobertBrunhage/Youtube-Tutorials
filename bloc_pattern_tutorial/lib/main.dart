import 'package:bloc_pattern_tutorial/blocs/counter_bloc.dart';
import 'package:bloc_pattern_tutorial/blocs/user_bloc.dart';
import 'package:bloc_pattern_tutorial/pages/bloc_counter_page.dart';
import 'package:bloc_pattern_tutorial/pages/bloc_user_page.dart';
import 'package:bloc_pattern_tutorial/pages/stream_counter_page.dart';
import 'package:bloc_pattern_tutorial/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc_pattern_tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: UserBloc(),
        child: BlocUserPage(),
      ),
    );
  }
}


