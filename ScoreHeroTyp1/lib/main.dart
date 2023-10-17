import 'package:flutter/material.dart';
import 'package:scoreherotyp1/screens/home_screen.dart';

import 'models/level.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User user = User(name: 'Benutzer');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness-App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(user: user),
    );
  }
}
