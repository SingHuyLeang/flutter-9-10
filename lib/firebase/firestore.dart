import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final firestore = FirebaseFirestore.instance.collection("products");
  Future<void> add() async {
    final map = {
      "name": "Product 1",
      "qty": 5,
      "price": 10.0,
      "discount": 5,
      "image":
          "https://imgs.search.brave.com/5H52NdNIoy2ofAE2vUqTDeX_tBf7gu8ojGthG0A9Q70/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wZWJi/bGVseS5jb20vY2F0/ZWdvcmllcy9qZXdl/bHJ5L3Jpbmctc2ls/ay5qcGc_d2lkdGg9/NzIwJnF1YWxpdHk9/NzU"
    };
    await firestore.doc().set(map).onError((error, stackTrace) =>
        log("Error add product to firestore: $error: $stackTrace"));
  }
}
