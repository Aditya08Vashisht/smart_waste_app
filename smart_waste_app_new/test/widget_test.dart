import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:smart_waste_app/screens/login_screen.dart';
import 'package:smart_waste_app/services/auth_service.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Mocks
class MockAuth extends Mock implements AuthService {}

class MockUser extends Mock implements User {}

void main() {
  late MockAuth mockAuth;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockAuth = MockAuth();

    // Stub only the exact combinations you test:
    when(
      mockAuth.signIn('test@example.com', 'password123'),
    ).thenAnswer((_) async => MockUser());

    when(
      mockAuth.signIn('wrong@example.com', 'wrongpassword'),
    ).thenAnswer((_) async => null);
  });

  Widget makeTestable(Widget child) {
    return MaterialApp(
      home: Provider<AuthService>.value(value: mockAuth, child: child),
    );
  }

  testWidgets('Login screen renders all required widgets', (tester) async {
    await tester.pumpWidget(makeTestable(const LoginScreen()));
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Successful login navigates away', (tester) async {
    await tester.pumpWidget(makeTestable(const LoginScreen()));
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password123');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    // After successful login, LoginScreen is popped
    expect(find.text('Login'), findsNothing);
  });

  testWidgets('Login button shows error if login fails', (tester) async {
    await tester.pumpWidget(makeTestable(const LoginScreen()));
    await tester.enterText(find.byType(TextField).first, 'wrong@example.com');
    await tester.enterText(find.byType(TextField).last, 'wrongpassword');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    expect(find.textContaining('failed'), findsOneWidget);
  });
}
