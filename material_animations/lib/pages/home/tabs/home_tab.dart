import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:material_animations/pages/selected_item_page/selected_item_page.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key key,
    @required this.textStyle,
  }) : super(key: key);

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(10, (index) {
        return OpenContainer(
          closedElevation: 0,
          closedBuilder: (context, action) {
            return buildListTile(index);
          },
          openBuilder: (context, action) {
            return SelectedItemPage(seletedItem: index);
          },
        );
      }),
    );
  }

  ListTile buildListTile(int index) {
    return ListTile(
      title: Text(
        index.toString(),
        style: textStyle,
      ),
    );
  }
}
