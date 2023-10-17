import 'package:flutter/material.dart';
import 'package:scoreherotyp1/models/level.dart';
import 'package:scoreherotyp1/screens/level_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Fitness'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Punkte',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '${user.points}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Willkommen, ${user.name}!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelListScreen(user: user),
                  ),
                );
              },
              child: Text('Starte das Abenteuer'),
            ),
          ],
        ),
      ),
    );
  }
}
