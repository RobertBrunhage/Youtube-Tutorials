import 'package:flutter/material.dart';
import 'package:state_management_example/cart/cart.dart';

import 'pages/home/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Cart>(
      builder: (_) => Cart(),
      dispose: (_, cart) => cart.dispose(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
