// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:snuggy/main.dart';

void main() {
  testWidgets('finds all sounds in the app', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we have all the sounds
    expect(find.text('Rain'), findsOneWidget);
    expect(find.text('Storm'), findsOneWidget);
    expect(find.text('Wind'), findsOneWidget);
    expect(find.text('Waves'), findsOneWidget);
    expect(find.text('Stream'), findsOneWidget);
    expect(find.text('Birds'), findsOneWidget);
    expect(find.text('Summer Night'), findsOneWidget);
    expect(find.text('Train'), findsOneWidget);
    expect(find.text('Boat'), findsOneWidget);
  });
}
