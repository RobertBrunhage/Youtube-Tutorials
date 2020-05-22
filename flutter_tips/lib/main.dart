import 'package:flutter/material.dart';
import 'package:flutter_tips/ui/tip_1_page.dart';
import 'package:flutter_tips/ui/tip_2_page.dart';
import 'package:flutter_tips/ui/tip_3_page.dart';
import 'package:flutter_tips/ui/tip_4_page.dart';
import 'package:flutter_tips/ui/tip_5_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Tip1Page(),
    );
  }
}
