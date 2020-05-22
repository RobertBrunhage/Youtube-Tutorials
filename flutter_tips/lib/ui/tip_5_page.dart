import 'package:flutter/material.dart';
import 'package:flutter_tips/ui/utils.dart';

// Rody Davis channel
// https://www.youtube.com/channel/UCqc2elhr0N52GVsyNaWtLvA

class Tip5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tip 5")),
      body: LayoutBuilder(
        builder: (context, dimens) {
          if (dimens.maxWidth >= kDesktopBreakpoint) {
            return Center(child: buildRow("Desktop", context));
          } else if (dimens.maxWidth >= kTabletBreakpoint) {
            return Center(child: buildRow("Tablet", context));
          } else {
            return Center(child: buildColumn("Mobile", context));
          }
        },
      ),
    );
  }

  Row buildRow(String text, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(text, style: Theme.of(context).textTheme.headline3),
        Text(text, style: Theme.of(context).textTheme.headline3),
      ],
    );
  }

  Column buildColumn(String text, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(text, style: Theme.of(context).textTheme.headline3),
        Text(text, style: Theme.of(context).textTheme.headline3),
      ],
    );
  }
}
