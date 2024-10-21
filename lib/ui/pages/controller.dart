import 'dart:developer';

import 'package:firebase_app/data/product.dart';
import 'package:firebase_app/firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppController extends GetxController {
  final firestore = Firestore();
  final nameCtr = TextEditingController();
  final qtyCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final discountCtr = TextEditingController();
  final imageUrlCtr = TextEditingController();
  final imageFile = "".obs;

  Future<void> addProduct() async {
    await firestore.add(
        Product(name: "name", qty: 1, price: 1, discount: 1, image: "image"));
  }

  // pick up image
  Future<void> pickImage() async {
    final xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      imageFile.value = xfile.path;
    }
    update();
  }
}
