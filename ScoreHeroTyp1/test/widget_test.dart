import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scoreherotyp1/main.dart';
import 'package:scoreherotyp1/models/level.dart';

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    // Erstelle einen tatsächlichen User
    final user = User(name: 'Benutzername');

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      user: user,
    ));

    // Hier kannst du deine Widget-Tests durchführen
    // Zum Beispiel:
    // expect(find.text('Welcome to All Fitness Gaming!'), findsOneWidget);
    // expect(find.text('Start Game'), findsOneWidget);
  });
}
