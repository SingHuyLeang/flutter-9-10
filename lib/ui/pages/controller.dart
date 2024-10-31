import 'dart:developer';
import 'dart:io';
import 'package:firebase_app/data/product.dart';
import 'package:firebase_app/firebase/firestore.dart';
import 'package:firebase_app/firebase/storage.dart';
import 'package:firebase_app/ui/pages/form_page.dart';
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
  final imageFile = "".obs;
  RxBool isUpdate = false.obs;
  final docId = "".obs;
  final imageURL = "".obs;
  final tempImageURL = "".obs;

  Future<void> addProduct() async {
    if (nameCtr.text.isEmpty ||
        qtyCtr.text.isEmpty ||
        priceCtr.text.isEmpty ||
        discountCtr.text.isEmpty ||
        imageFile.value.isEmpty) {
      Get.snackbar("Notication", "All fields are required!");
    } else {
      await firestore.add(Product(
        name: nameCtr.text.trim(),
        qty: int.parse(qtyCtr.text),
        price: double.parse(priceCtr.text),
        discount: double.parse(discountCtr.text),
        image: await storage.add(File(imageFile.value)),
      ));
      Get.snackbar("Notification", "Product added successfully!");
      clears();
    }
  }

  Future<void> updateProduct() async {
    if (docId.value.isEmpty ||
        nameCtr.text.isEmpty ||
        qtyCtr.text.isEmpty ||
        priceCtr.text.isEmpty ||
        discountCtr.text.isEmpty) {
      Get.snackbar("Notication", "All fields are required!");
    } else {
      log("URL : ${imageURL.value}");
      await firestore.update(
        docId.value,
        Product(
          name: nameCtr.text.trim(),
          qty: int.parse(qtyCtr.text),
          price: double.parse(priceCtr.text),
          discount: double.parse(discountCtr.text),
          image: await storage.update(File(imageFile.value), imageURL.value),
        ),
      );
      Get.snackbar("Notification", "Product update successfully!");
      clears();
    }
  }

  // pick up image
  Future<void> pickImage() async {
    final xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      imageFile.value = xfile.path;
      if (isUpdate.value && imageFile.value.isNotEmpty) {
        tempImageURL.value = "";
      }
    }
    update();
  }

  void clears() {
    nameCtr.clear();
    qtyCtr.clear();
    priceCtr.clear();
    discountCtr.clear();
    imageURL.value = "";
    imageFile.value = "";
  }

  // update
  void navigateToUpdate(String docId, Product product) async {
    Get.to(() => FormProductPage());
    this.docId.value = docId;
    nameCtr.text = product.name;
    qtyCtr.text = product.qty.toString();
    priceCtr.text = product.price.toString();
    discountCtr.text = product.discount.toString();
    imageURL.value = product.image;
    tempImageURL.value = product.image;
    isUpdate = true.obs;
  }

  // delete
  Future<void> deleteProduct(String docId) async {
    await firestore
        .delete(docId)
        .whenComplete(() => log("Successfully deleted"));
  }

  // back navigation
  void back() async {
    Get.back();
    clears();
    isUpdate = false.obs;
  }
}
