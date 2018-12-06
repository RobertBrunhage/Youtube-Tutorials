import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
// https://docs.flutter.io/flutter/dart-ui/AppLifecycleState-class.html


class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.paused:
        print('paused state');
        break;
      case AppLifecycleState.resumed:
        print('resumed state');
        break;
      case AppLifecycleState.inactive:
        print('inactive state');
        break;
      case AppLifecycleState.suspending:
        print('suspending state');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
