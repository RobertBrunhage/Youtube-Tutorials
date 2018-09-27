import 'package:flutter/material.dart';
import 'package:signup_screen_card/Pages/SignUp.dart';

void main() => runApp(new SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFFE8716D),
        primaryColor: Color(0xFF2E3E52),
        buttonColor: Color(0xFF6ADCC8),
        primaryColorDark: Color(0xFF7C8BA6),
      ),
      home: new SignUp(),
    );
  }
}


