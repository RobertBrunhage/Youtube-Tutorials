import 'package:flutter/material.dart';
import 'mobx/cart.dart';
import 'pages/home/home.dart';
import 'package:provider/provider.dart';

final cart = Cart();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Cart>(
      builder: (_) => Cart(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
