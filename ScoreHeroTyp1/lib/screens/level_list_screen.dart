import 'package:flutter/material.dart';
import 'package:scoreherotyp1/models/level.dart';

import 'level_screen.dart';

class LevelListScreen extends StatelessWidget {
  final User user;

  LevelListScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Auswahl'),
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
      body: ListView.builder(
        itemCount: AppData.levels.length,
        itemBuilder: (context, index) {
          final level = AppData.levels[index];
          final isUnlocked = user.points >= level.requiredPoints;

          return ListTile(
            title: Text('Level ${level.id} - ${level.title}'),
            subtitle: Text(level.description),
            trailing: isUnlocked ? Icon(Icons.lock_open) : Icon(Icons.lock),
            onTap: () {
              if (isUnlocked) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LevelScreen(user: user, levelId: level.id),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Dieses Level ist noch nicht freigeschaltet. Benötigte Punkte: ${level.requiredPoints}',
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
