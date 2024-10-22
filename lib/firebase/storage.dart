import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorage {
  final storage = FirebaseStorage.instance;
  Future<String> add(File filename) async {
    try {
      final file = "images/${DateTime.now().millisecondsSinceEpoch}.jpg";
      await storage.ref(file).putFile(filename);
      return await storage.ref(file).getDownloadURL();
    } on FirebaseException catch (e) {
      log("Error uploading file: $e");
      rethrow;
    }
  }
}