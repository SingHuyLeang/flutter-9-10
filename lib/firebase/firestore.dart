import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/data/product.dart';

class Firestore {
  final firestore = FirebaseFirestore.instance.collection("products");

  Stream<QuerySnapshot<Map<String, dynamic>>> get firestoreSnapshots => firestore.snapshots();

  Future<void> add(Product product) async {
    try {
      await firestore.doc().set(product.toJson()).onError((error, stackTrace) =>
          log("Error add product to firestore: $error: $stackTrace"));
    } on FirebaseFirestore catch (e) {
      log("Exception add product to firestore: $e");
    }
  }
}
