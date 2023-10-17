class Level {
  final int id;
  final String title;
  final String description;

  Level({
    required this.id,
    required this.title,
    required this.description,
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

class LevelData {
  static List<Level> levels = [
    Level(id: 1, title: 'Level 1', description: 'Beschreibung für Level 1'),
    Level(id: 2, title: 'Level 2', description: 'Beschreibung für Level 2'),
    // Weitere Level hinzufügen
  ];

  static List<Story> stories = [
    Story(
        levelId: 1,
        text: 'Text für Anfangsgeschichte von Level 1',
        imagePath: 'image1.jpg'),
    Story(
        levelId: 2,
        text: 'Text für Anfangsgeschichte von Level 2',
        imagePath: 'image2.jpg'),
    // Weitere Geschichten hinzufügen
  ];
}
