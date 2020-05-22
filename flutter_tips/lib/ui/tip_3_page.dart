import 'package:flutter/material.dart';

// FilledStacks channel
// https://www.youtube.com/channel/UC2d0BYlqQCdF9lJfydl_02Q

// Wrapper for stateful functionality to provide onInit calls in stateless widget
class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({
    @required this.onInit,
    @required this.child,
  })  : assert(onInit != null, "If you are not using onInit then there is no reason to use this widget."),
        assert(child != null, "Child should not be null.");

  final VoidCallback onInit;
  final Widget child;

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class Tip3Page extends StatelessWidget {
  final textNotifier = ValueNotifier<String>("Init is happnening");

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        await Future.delayed(Duration(seconds: 2));
        textNotifier.value = "Init has happened and we are inside a stateless widget";
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Tip 3")),
        body: Center(
          child: ValueListenableBuilder<String>(
            valueListenable: textNotifier,
            builder: (context, text, _) {
              return Text(
                text,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ),
    );
  }
}
