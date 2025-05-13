import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_waste_app/screens/report_waste_screen.dart';

void main() {
  testWidgets('ReportWasteScreen UI renders correctly and accepts input', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ReportWasteScreen()));

    // Check initial UI
    expect(find.text('Waste Description'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text("Take Photo"), findsOneWidget);
    expect(find.text("Submit Report"), findsOneWidget);

    // Enter text in description
    await tester.enterText(find.byType(TextField), 'Garbage at Sector 15');
    await tester.pump();

    expect(find.text('Garbage at Sector 15'), findsOneWidget);
  });
}
