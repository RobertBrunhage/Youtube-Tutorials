import 'dart:async';

import 'package:flutter/material.dart';

class StreamCounterPage extends StatefulWidget {
  StreamCounterPage({Key key}) : super(key: key);

  @override
  _StreamCounterPageState createState() => _StreamCounterPageState();
}

class _StreamCounterPageState extends State<StreamCounterPage> {
  final StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    // We need to dispose / close the StreamController
    // when we don't need it to free up resources
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            StreamBuilder<int>(
              // We are listening to a stream, when a value goes out the stream
              // we update the text
              stream: _streamController.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                return Text('${snapshot.data}', style: Theme.of(context).textTheme.display1,);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _streamController.sink.add(++_counter);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}