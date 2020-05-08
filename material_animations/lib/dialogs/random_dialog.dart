import 'package:flutter/material.dart';

class RandomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 100,
        child: Center(
          child: Text("Nice Dialog"),
        ),
      ),
    );
  }
}
