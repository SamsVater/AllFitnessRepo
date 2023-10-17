import 'package:flutter/material.dart';

// Klassen für Level, Stories und Benutzer
class Level {
  final int id;
  final String title;
  final String description;
  final int requiredPoints;

  Level({
    required this.id,
    required this.title,
    required this.description,
    required this.requiredPoints,
  });
}

class Story {
  final int levelId;
  final String text;
  final String imagePath;

  Story({
    required this.levelId,
    required this.text,
    required this.imagePath,
  });
}

class User {
  String name;
  int completedLevels;
  int points;

  User({required this.name, this.completedLevels = 0, this.points = 0});
}

// Statische Daten für Levels
class AppData {
  static List<Level> levels = [
    Level(
      id: 1,
      title: 'Level 1',
      description: 'Beschreibung für Level 1',
      requiredPoints: 0,
    ),
    Level(
      id: 2,
      title: 'Level 2',
      description: 'Beschreibung für Level 2',
      requiredPoints: 100,
    ),
    // Weitere Level hinzufügen
  ];
}

// Klasse zur Überprüfung von Levelbedingungen
class LevelConditions {
  static bool canProceedToLevel(int currentLevel, User user) {
    if (currentLevel == 1) {
      return user.points >= 100;
    }
    return false;
  }
}

// Klassen für Fragen und Antwortmöglichkeiten
class Question {
  final int levelId;
  final String text;
  final List<AnswerOption> options;
  final int points;

  Question({
    required this.levelId,
    required this.text,
    required this.options,
    required this.points,
  });
}

class AnswerOption {
  final String text;
  final bool isCorrect;

  AnswerOption({required this.text, this.isCorrect = false});
}
