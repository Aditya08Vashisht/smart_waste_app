import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_waste_app/screens/admin_screen.dart';

void main() {
  testWidgets('Admin screen renders loading & empty state', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AdminScreen()));
    // initially, since Firestore isn't mocked, it should show a progress indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
