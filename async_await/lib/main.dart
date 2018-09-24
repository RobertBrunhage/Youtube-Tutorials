import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void thenCatch(){
    print('Started');
    Future.delayed(Duration(seconds: 2)).then((_) {
      print('Completed');
    }).catchError((e){
      print('failed: ${e.toString()}');
    });
  }

  Future<void> asyncAwait() async{
    print('Started');
    try{
      await Future.delayed(Duration(seconds: 2));
      print('Completed first');
      await Future.delayed(Duration(seconds: 1));
      print('Completed second');
    }catch(e){
      print('failed: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: thenCatch,
            child: Text('Then Catch'),
          ),
          RaisedButton(
            onPressed: asyncAwait,
            child: Text('Async await'),
          ),
        ],
      ),
    );
  }
}
