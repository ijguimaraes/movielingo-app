// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:movielingo_app/main.dart';

void main() {
  testWidgets('Login screen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MovieLingoApp());

    // Verify that the login screen elements are present.
    expect(find.text('MovieLingo'), findsOneWidget);
    expect(find.text('Aprenda idiomas assistindo filmes'), findsOneWidget);
    expect(find.text('Continuar com Google'), findsOneWidget);
    expect(find.text('Continuar com Facebook'), findsOneWidget);
    expect(find.text('Continuar com Apple'), findsOneWidget);
  });
}
