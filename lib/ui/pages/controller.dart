import 'dart:io';

import 'package:firebase_app/data/product.dart';
import 'package:firebase_app/firebase/firestore.dart';
import 'package:firebase_app/firebase/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppController extends GetxController {
  final firestore = Firestore();
  final storage = FireStorage();
  final nameCtr = TextEditingController();
  final qtyCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final discountCtr = TextEditingController();
  final imageUrlCtr = TextEditingController();
  final imageFile = "".obs;

  Future<void> addProduct() async {
    if (nameCtr.text.isEmpty ||
        qtyCtr.text.isEmpty ||
        priceCtr.text.isEmpty ||
        discountCtr.text.isEmpty ||
        imageUrlCtr.text.isEmpty) {
      Get.snackbar("Notication", "All fields are required!");
    } else {
      await firestore.add(Product(
        name: nameCtr.text.trim(),
        qty: int.parse(qtyCtr.text),
        price: double.parse(priceCtr.text),
        discount: double.parse(discountCtr.text),
        image: imageUrlCtr.text,
      ));
    }
  }

  // pick up image
  Future<void> pickImage() async {
    final xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      imageFile.value = xfile.path;
      await storage.add(File(imageFile.value));
    }
    update();
  }
}
