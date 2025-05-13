import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> uploadReport(String description, File image, String type) async {
    // upload image
    String imageUrl = '';
    final ref = _storage.ref().child(
      'waste_images/${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await ref.putFile(image);
    imageUrl = await ref.getDownloadURL();

    // save report
    await _firestore.collection('waste_reports').add({
      'description': description,
      'imageUrl': imageUrl,
      'type': type,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
