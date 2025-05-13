import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_waste_app/screens/home_screen.dart';

void main() {
  testWidgets('Home screen shows welcome and FAB', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.text("Welcome User 👋"), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text("Report Waste"), findsOneWidget);
  });
}
