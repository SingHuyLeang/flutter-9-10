import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/data/product.dart';

class Firestore {
  final firestore = FirebaseFirestore.instance.collection("products");

  Stream<QuerySnapshot<Map<String, dynamic>>> get firestoreSnapshots =>
      firestore.snapshots();

  Future<void> add(Product product) async {
    try {
      await firestore.doc().set(product.toJson()).onError((error, stackTrace) =>
          log("Error add product to firestore: $error: $stackTrace"));
    } on FirebaseFirestore catch (e) {
      log("Exception add product to firestore: $e");
    }
  }

  Future<void> update(String id, Product product) async {
    try {
      await firestore.doc(id).set(product.toJson()).onError(
            (error, stackTrace) =>
                log("Error add product to firestore: $error: $stackTrace"),
          );
    } on FirebaseException catch (e) {
      log("Exception update product to firestore: ${e.message}");
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.doc(id).delete().onError((error, stackTrace) =>
          log("Error delete product from firestore: $error: $stackTrace"));
    } on FirebaseException catch (e) {
      log("Exception delete product to firestore: ${e.message}");
    }
  }
}
