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
      home: new MyHomePage(title: 'Form Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//globalkey
//email, password variable
//form
//textformfield
//submit

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email:'
                    ),
                    validator: (input) => !input.contains('@') ? 'Not a valid Email' : null,
                    onSaved: (input) => _email = input,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password:'
                    ),
                    validator: (input) => input.length < 8 ? 'You need at least 8 characters' : null,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: _submit,
                          child: Text('Sign in'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _submit(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }
}
