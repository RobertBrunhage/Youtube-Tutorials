import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_handling/providers/dog_notifier.dart';

class HomePage extends StatelessWidget {
  final double verticalSpacing = 42;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: verticalSpacing),
            const Text("DogApi"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: verticalSpacing,
                  child: Icon(Icons.arrow_upward),
                ),
                SizedBox(
                  height: verticalSpacing,
                  child: Icon(Icons.arrow_downward),
                ),
              ],
            ),
            const Text("DogNotifier"),
            SizedBox(
              height: verticalSpacing,
              child: Icon(Icons.arrow_upward),
            ),
            Consumer<DogNotifier>(
              builder: (context, dogNotifier, _) {
                return RaisedButton(
                  onPressed: dogNotifier.state == LoadingStates.loading ? null : () => dogNotifier.fetchDog(),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  color: Colors.blue.shade200,
                  child: const Text("FETCH"),
                );
              },
            ),
            Consumer<DogNotifier>(
              builder: (context, dogNotifier, _) {
                if (dogNotifier.state == LoadingStates.error) {
                  return Container(
                    height: 400,
                    alignment: Alignment.center,
                    child: const Text("Something went wrong fetching the image. Try again."),
                  );
                }
                return Image.network(
                  dogNotifier.dog.image,
                  gaplessPlayback: true,
                  height: 400,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
