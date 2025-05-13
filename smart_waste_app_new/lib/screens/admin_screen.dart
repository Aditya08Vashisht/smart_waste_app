import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/waste_report.dart';
import 'login_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  Stream<List<WasteReport>> _reportsStream() {
    return FirebaseFirestore.instance
        .collection('waste_reports')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((doc) => WasteReport.fromDocument(doc)).toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed:
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
          ),
        ],
      ),
      body: StreamBuilder<List<WasteReport>>(
        stream: _reportsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final reports = snapshot.data ?? [];
          if (reports.isEmpty) {
            return const Center(child: Text("No reports yet."));
          }
          return ListView.builder(
            itemCount: reports.length,
            itemBuilder: (context, i) {
              final r = reports[i];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    r.imageUrl,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(r.description),
                  subtitle: Text(
                    "${r.type} • ${r.timestamp.toLocal().toString().split('.').first}",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
