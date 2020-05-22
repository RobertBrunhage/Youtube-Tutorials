import 'package:flutter/material.dart';

// The usage of @required decorator and assert in the constructor

class Tip4Page extends StatelessWidget {
  const Tip4Page({
    Key key,
    @required this.title,
  })  : assert(title != null, "Title string should not be null."),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tip 4")),
      body: Center(
        child: Text(title, style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
