import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        horizontalLine(),
        Text("OR", style: Theme.of(context).textTheme.subtitle1),
        horizontalLine(),
      ],
    );
  }

  Widget horizontalLine() {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 2,
      width: 124,
      color: Colors.grey,
    );
  }
}
