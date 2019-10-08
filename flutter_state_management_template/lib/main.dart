import 'package:flutter/material.dart';
import 'home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: 2. Add provider for the cart
    return MaterialApp(
      home: Home(),
    );
  }
}
