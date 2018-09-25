import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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
  static const String iapId = 'android.test.purchased';
  List<IAPItem> _items = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // prepare
    var result = await FlutterInappPurchase.initConnection;
    print('result: $result');

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // refresh items for android
    String msg = await FlutterInappPurchase.consumeAllItems;
    print('consumeAllItems: $msg');
    await _getProduct();
  }

  Future<Null> _getProduct() async {
    List<IAPItem> items = await FlutterInappPurchase.getProducts([iapId]);
    for (var item in items) {
      print('${item.toString()}');
      this._items.add(item);
    }

    setState(() {
      this._items = items;
    });
  }

  Future<Null> _buyProduct(IAPItem item) async {
    try {
      PurchasedItem purchased = await FlutterInappPurchase.buyProduct(item.productId);
      print(purchased);
      String msg = await FlutterInappPurchase.consumeAllItems;
      print('consumeAllItems: $msg');
    } catch (error) {
      print('$error');
    }
  }

  List<Widget> _renderButton() {
    List<Widget> widgets = this._items.map((item) =>
      Container(
        height: 250.0,
        width: double.infinity,
        child: Card(
          child: Column(
            children: <Widget>[
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.center,
                child: Text('Banana', style: Theme
                  .of(context)
                  .textTheme
                  .display1,),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.center,
                child: Text('This is a consumable item', style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),),
              ),
              Align(
                alignment: Alignment.center,
                child: Text('Which you can buy multiple times', style: TextStyle(fontSize: 16.0, color: Colors.grey[700])),
              ),
              SizedBox(height: 24.0),
              SizedBox(
                width: 340.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () => _buyProduct(item),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                  child: Text('Buy ${item.price} ${item.currency}', style: Theme
                    .of(context)
                    .primaryTextTheme
                    .button,),
                ),
              ),
            ],
          ),
        ),
      ),

    ).toList();
    return widgets;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Column(children: this._renderButton()),
    );
  }
}
