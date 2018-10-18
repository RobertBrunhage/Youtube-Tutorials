import 'package:bloc_pattern_tutorial/blocs/counter_bloc.dart';
import 'package:bloc_pattern_tutorial/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class BlocCounterPage extends StatefulWidget {
  BlocCounterPage({Key key}) : super(key: key);

  @override
  _BlocCounterPageState createState() => _BlocCounterPageState();
}

class _BlocCounterPageState extends State<BlocCounterPage> {

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
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
              stream: counterBloc.outCounter,
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
          counterBloc.incrementCounter.add(null);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}