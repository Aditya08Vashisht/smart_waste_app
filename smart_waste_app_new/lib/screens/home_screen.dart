import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'report_waste_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await context.read<AuthService>().signOut();
              if (!context.mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text("Welcome User 👋")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ReportWasteScreen()),
            ),
        icon: const Icon(Icons.add),
        label: const Text("Report Waste"),
      ),
    );
  }
}
