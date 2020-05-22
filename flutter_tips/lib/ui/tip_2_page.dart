import 'package:flutter/material.dart';

// Fireship channel
// https://www.youtube.com/channel/UCsBjURrPoezykLs9EqgamOA

class Tip2Page extends StatelessWidget {
  final isOpenNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tip 2")),
      body: Center(
        child: GestureDetector(
          onTap: () => isOpenNotifier.value = !isOpenNotifier.value,
          child: SizedBox(
            width: 50,
            child: ValueListenableBuilder<bool>(
              valueListenable: isOpenNotifier,
              builder: (context, isOpen, _) {
                return AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.easeOutQuart,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue,
                    boxShadow: [
                      if (isOpen) //
                        for (var i = 0; i < 5; i++) //
                          BoxShadow(
                            spreadRadius: i * 40.0,
                            color: Colors.lightBlue.withAlpha((255 ~/ 5)),
                          ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
