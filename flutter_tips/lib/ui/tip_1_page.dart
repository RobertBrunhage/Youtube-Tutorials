import 'package:flutter/material.dart';

class Tip1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tip 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.red,
            ),
            Spacer(),
            ...textList(context),
            Spacer(),
            Container(
              height: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  List<Text> textList(BuildContext context) {
    return [
      Text("This is the first text", style: Theme.of(context).textTheme.headline4),
      Text("This is the second text", style: Theme.of(context).textTheme.headline4),
      Text("This is the third text", style: Theme.of(context).textTheme.headline4),
      Text("This is the and so on text", style: Theme.of(context).textTheme.headline4),
      Text("This is the and so on text", style: Theme.of(context).textTheme.headline4),
    ];
  }
}
