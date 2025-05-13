import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCxRBb278MIVOBSMkE4-z6mp5OpSQnO2Gw",
        authDomain: "my-sdg-project.firebaseapp.com",
        projectId: "my-sdg-project",
        storageBucket: "my-sdg-project.appspot.com",
        messagingSenderId: "839119626953",
        appId: "1:839119626953:web:66c10189eed6b0ead9e318",
        measurementId: "G-QRPNTDS7K1",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const SmartWasteApp());
}

class SmartWasteApp extends StatelessWidget {
  const SmartWasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<AuthService>(create: (_) => AuthService())],
      child: MaterialApp(
        title: 'Smart Waste App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const LoginScreen(),
      ),
    );
  }
}
