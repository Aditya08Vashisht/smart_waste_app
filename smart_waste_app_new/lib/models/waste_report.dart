import 'package:cloud_firestore/cloud_firestore.dart';

class WasteReport {
  final String id;
  final String description;
  final String imageUrl;
  final String type;
  final DateTime timestamp;

  WasteReport({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.timestamp,
  });

  factory WasteReport.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return WasteReport(
      id: doc.id,
      description: data['description'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? '',
      type: data['type'] as String? ?? 'Unknown',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
