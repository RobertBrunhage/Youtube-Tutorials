import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/models/user.dart';

void main() =>
  runApp(
    new MyApp(user: User(),)
  );

class MyApp extends StatelessWidget {
  final User user;

  const MyApp({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
      model: user,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: ScopedModelDescendant<User>(
          builder: (context, child, model) {
            return Text(model.name, style: Theme
              .of(context)
              .textTheme
              .title,);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNamePage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class ChangeNamePage extends StatefulWidget {
  @override
  ChangeNamePageState createState() {
    return new ChangeNamePageState();
  }
}

class ChangeNamePageState extends State<ChangeNamePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScopedModelDescendant<User>(
          builder: (context, child, model) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: model.name
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    model.changeName(_nameController.text);
                    setState(() {
                      _nameController.text = '';
                    });
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('name changed to ${model.name}'))
                    );
                  },
                  child: Text('change name'),
                )
              ]
            );
          },
        ),
      ),
    );
  }
}

