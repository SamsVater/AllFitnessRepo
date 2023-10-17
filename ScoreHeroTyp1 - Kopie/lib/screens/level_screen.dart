import 'package:flutter/material.dart';
import 'package:scoreherotyp1/models/level.dart' as story_model;

import '../models/level.dart'; // Alias hinzugefügt

class LevelScreen extends StatefulWidget {
  final int levelId;

  LevelScreen({required this.levelId});

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  late Level _level;
  late story_model.Story _currentStory; // Alias verwenden

  @override
  void initState() {
    super.initState();
    _level = LevelData.levels.firstWhere((level) => level.id == widget.levelId);
    _currentStory = LevelData.stories
        .firstWhere((story) => story.levelId == widget.levelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${_level.id} - ${_level.title}'),
      ),
      body: Column(
        children: [
          Image.asset(_currentStory.imagePath),
          Text(_currentStory.text),
          ElevatedButton(
            onPressed: () {
              // Load the next story or complete the level
              // Update _currentStory based on the player's choices/actions
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
