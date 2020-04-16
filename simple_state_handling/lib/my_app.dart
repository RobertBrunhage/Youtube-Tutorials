import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_handling/models/dog.dart';
import 'package:simple_state_handling/pages/home_page/home_page.dart';
import 'package:simple_state_handling/providers/dog_notifier.dart';
import 'package:simple_state_handling/services/api.dart';
import 'package:simple_state_handling/services/dog_services/dog_api.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Api<Dog>>(
          create: (_) => DogApi(),
        ),
        ChangeNotifierProvider<DogNotifier>(
          create: (context) => DogNotifier(
            context.read<Api<Dog>>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
