import 'dart:ui' as dartUI;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Application',
      theme: ThemeData(
        primaryColor: Color(0xFF3D4878),
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Align buildTitle(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Text('Welcome', style: TextStyle(fontSize: 32.0, color: Theme
          .of(context)
          .primaryColor,),),
      ),
    );
  }

  Align buildCircle() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 225.0),
        child: Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Align buildFrostedGlass() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BackdropFilter(
        filter: dartUI.ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          height: 300.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.3),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.0,
              child: buildButton(),
            ),
          ),
        ),
      ),
    );
  }

  Column buildButton() {
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        SizedBox(
          width: 175.0,
          height: 50.0,
          child: FlatButton(
            onPressed: () {},
            color: theme.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Text('Sign in', style: theme.primaryTextTheme.button,)
          ),
        ),
        FlatButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Text('Sign up', style: TextStyle(color: theme.primaryColor),)
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildTitle(context),
          buildCircle(),
          buildFrostedGlass(),
        ],
      ),
    );
  }
}
