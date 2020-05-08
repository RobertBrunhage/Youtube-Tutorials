import 'package:flutter/material.dart';

class SelectedItemPage extends StatelessWidget {
  const SelectedItemPage({
    Key key,
    @required this.seletedItem,
  }) : super(key: key);

  final int seletedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected item page"),
      ),
      body: Center(
        child: Text(seletedItem.toString()),
      ),
    );
  }
}
