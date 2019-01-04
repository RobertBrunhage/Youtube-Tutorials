import 'package:bloc_pattern_tutorial/blocs/user_bloc.dart';
import 'package:bloc_pattern_tutorial/models/user.dart';
import 'package:bloc_pattern_tutorial/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class BlocUserPage extends StatefulWidget {
  @override
  _BlocUserPageState createState() => _BlocUserPageState();
}

class _BlocUserPageState extends State<BlocUserPage> {
  String _newName;

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Bloc'),
      ),
      body: StreamBuilder<User>(
        stream: userBloc.outUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${snapshot.data.name}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  TextField(
                    onChanged: (value) => _newName = value,
                    decoration: InputDecoration(labelText: snapshot.data.name),
                  ),
                ],
              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userBloc.updateName(_newName);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
