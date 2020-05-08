import 'package:flutter/material.dart';

class SchoolTab extends StatelessWidget {
  const SchoolTab({
    Key key,
    @required this.textStyle,
  }) : super(key: key);

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Index 2: School',
        style: textStyle,
      ),
    );
  }
}
