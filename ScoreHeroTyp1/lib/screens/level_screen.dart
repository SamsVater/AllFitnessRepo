import 'package:flutter/material.dart';
import 'package:scoreherotyp1/models/level.dart';
import 'package:video_player/video_player.dart';

class LevelScreen extends StatefulWidget {
  final User user;
  final int levelId;

  LevelScreen({required this.user, required this.levelId});

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  int userPoints = 0;
  bool levelCompleted = false;
  late VideoPlayerController? _controller;
  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.levelId == 2) {
      levelCompleted = true;
    } else {
      _controller = VideoPlayerController.asset('lib/videos/kurzclip.mp4')
        ..initialize().then((_) {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Level level = findLevelById(widget.levelId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${level.id} - ${level.title}'),
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
                  '$userPoints',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Willkommen bei All Fitness Gaming!\nSchau dir das Video an, um 100 Punkte zu erhalten.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          if (!levelCompleted)
            ElevatedButton(
              onPressed: () {
                _controller =
                    VideoPlayerController.asset('lib/videos/kurzclip.mp4')
                      ..initialize().then((_) {
                        _controller!.play();
                        _controller!.addListener(() {
                          if (_controller!.value.isCompleted) {
                            setState(() {
                              userPoints += 100;
                              levelCompleted = true;
                              widget.user.points = userPoints;
                            });
                          }
                        });
                      });

                setState(() {
                  isVideoPlaying = true;
                });
              },
              child: Text('Play'),
            ),
          if (isVideoPlaying && !levelCompleted)
            AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            ),
          Text('Punktzahl: $userPoints'),
          if (levelCompleted)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Zurück zur Liste'),
            ),
        ],
      ),
    );
  }

  Level findLevelById(int id) {
    return AppData.levels.firstWhere((level) => level.id == id);
  }
}
