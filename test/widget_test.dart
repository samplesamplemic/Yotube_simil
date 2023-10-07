import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quack_pics/main.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('searchBar functionality', () {

    testWidgets('Change theme', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our theme starts at with dark-theme.
      expect(find.byIcon(Icons.brightness_2_outlined), findsOneWidget);
      expect(find.byIcon(Icons.wb_sunny_outlined), findsNothing);

      // Tap the dark-theme icon and change icon and theme.
      await tester.tap(find.byIcon(Icons.brightness_2_outlined));
      await tester.pump();

      // Verify that theme is changed.
      expect(find.byIcon(Icons.brightness_2_outlined), findsOneWidget);
      expect(find.byIcon(Icons.wb_sunny_outlined), findsNothing);
    });
  });
}
