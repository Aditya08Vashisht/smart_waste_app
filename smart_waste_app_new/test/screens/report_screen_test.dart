import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_waste_app/screens/report_screen.dart';

void main() {
  testWidgets('Report screen has text fields and submit button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ReportScreen()));

    expect(find.byType(TextField), findsNWidgets(2)); // location + description
    expect(find.text('Submit Report'), findsOneWidget);
  });
}
