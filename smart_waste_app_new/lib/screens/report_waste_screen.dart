import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/firestore_service.dart';
import '../services/classification_service.dart';

class ReportWasteScreen extends StatefulWidget {
  const ReportWasteScreen({super.key});

  @override
  State<ReportWasteScreen> createState() => _ReportWasteScreenState();
}

class _ReportWasteScreenState extends State<ReportWasteScreen> {
  final TextEditingController _descController = TextEditingController();
  File? _imageFile;
  String? _predictedType;

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickAndClassify() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked == null) return;

    setState(() => _imageFile = File(picked.path));

    // run your TFLite classification
    final prediction = await ClassificationService().classifyImage(_imageFile!);
    if (!mounted) return;
    setState(() => _predictedType = prediction);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Predicted: $prediction')));
  }

  Future<void> _submitReport() async {
    final desc = _descController.text.trim();
    if (_imageFile == null || _predictedType == null || desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fill all fields & take a photo')),
      );
      return;
    }

    // show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    await FirestoreService().uploadReport(desc, _imageFile!, _predictedType!);
    if (!mounted) return;
    Navigator.pop(context); // dismiss loading

    // reset UI
    setState(() {
      _imageFile = null;
      _predictedType = null;
    });
    _descController.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Report submitted!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report Waste')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _descController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                if (_imageFile != null)
                  Image.file(_imageFile!, height: 200, fit: BoxFit.cover)
                else
                  const Text('No image selected'),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _pickAndClassify,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Take & Classify'),
                ),
                if (_predictedType != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'Predicted: $_predictedType',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitReport,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
