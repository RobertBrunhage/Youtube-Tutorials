import 'package:flutter/material.dart';

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
      home: ConfigurationExample(),
    );
  }
}

class ConfigurationExample extends StatelessWidget {
  final environmentConfiguration = EnvironmentConfiguration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          if (environmentConfiguration.showRedBox)
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class EnvironmentConfiguration {
  final showRedBox = const bool.fromEnvironment("showRedBox");
}
