import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitReport() {
    final location = _locationController.text.trim();
    final description = _descriptionController.text.trim();

    if (location.isNotEmpty && description.isNotEmpty) {
      // This is where you'll call Firestore later!
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Report Submitted Successfully')),
      );

      _locationController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Waste'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitReport,
              child: const Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
