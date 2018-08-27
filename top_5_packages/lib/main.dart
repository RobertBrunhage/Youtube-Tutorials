import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:top_5_packages/Helpers/UrlLauncher.dart';
import 'package:top_5_packages/Models/CounterModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_5_packages/Helpers/NoficationPlugin.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp(model: CounterModel()));
}

class MyApp extends StatelessWidget {
  final CounterModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: model,
      child: MaterialApp(
        title: 'Top 5 Packages',
        home: CounterHome('Top 5 Packages'),
      ),
    );
  }
}

class CounterHome extends StatefulWidget {
  final String title;
  CounterHome(this.title);

  @override
  CounterHomeState createState() {
    return new CounterHomeState();
  }
}

class CounterHomeState extends State<CounterHome> {
  File _imageFile;
  NotificationPlugin notification = new NotificationPlugin();
  UrlLauncher urlLauncher = new UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ScopedModelExample(),
          Divider(),
          imagePickerPackage(),
          Divider(),
          notificationPackageButton(),
          Divider(),
          urlLauncherPackageButtons(),
          Divider(),
          sharePackageButton()
        ],
      ),
    );
  }

  imagePickerPackage() {
    return InkWell(
      onTap: takeImage,
      child: Container(
        height: 300.0,
        width: 100.0,
        child: _imageFile != null ? Image.file(_imageFile) : Placeholder(),
      ),
    );
  }

  notificationPackageButton() {
    return Center(
      child: RaisedButton(
        onPressed: () => notification.showNotification(),
        child: Text('Notification'),
      ),
    );
  }

  urlLauncherPackageButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            urlLauncher.launchURL();
          },
          child: Text('UrlLauncher'),
        ),
        RaisedButton(
          onPressed: () {
            urlLauncher.launchInWebViewOrVC();
          },
          child: Text('WebViewLauncher'),
        )
      ],
    );
  }

  sharePackageButton(){
    return Center(
      child: RaisedButton(
          onPressed: () =>
              Share.share('check out my website https://example.com'), child: Text('Share'),),
    );
  }

  takeImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }
}

class ScopedModelExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('You have pushed the button this many times:'),
          ScopedModelDescendant<CounterModel>(
            builder: (context, child, model) {
              return Text(
                model.counter.toString(),
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowCounter())),
                child: Text('ShowCounter'),
              ),
              ScopedModelDescendant<CounterModel>(
                builder: (context, child, model) {
                  return RaisedButton(
                    onPressed: model.increment,
                    child: Text('Increment'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShowCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Counter'),
      ),
      body: Container(
        child: Center(
          child: ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) => Text(
                    model.counter.toString(),
                    style: TextStyle(fontSize: 50.0),
                  )),
        ),
      ),
      floatingActionButton: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return FloatingActionButton(
            onPressed: model.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
