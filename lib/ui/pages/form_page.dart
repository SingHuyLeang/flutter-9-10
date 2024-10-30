import 'dart:io';

import 'package:firebase_app/ui/components/input.dart';
import 'package:firebase_app/ui/pages/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormProductPage extends StatelessWidget {
  FormProductPage({super.key});
  final appCtr = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => appCtr.back(),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Product Form'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async => appCtr.pickImage(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1.5,
                      ),
                      image: appCtr.tempImageURL.value.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(appCtr.tempImageURL.value))
                          : appCtr.imageFile.value.isNotEmpty
                              ? DecorationImage(
                                  image:
                                      FileImage(File(appCtr.imageFile.value)))
                              : const DecorationImage(
                                  image: AssetImage("assets/images/image.png"),
                                ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Input(controller: appCtr.nameCtr, label: "Name"),
                const SizedBox(height: 16),
                Input(controller: appCtr.qtyCtr, label: "Quantity"),
                const SizedBox(height: 16),
                Input(controller: appCtr.priceCtr, label: "Price"),
                const SizedBox(height: 16),
                Input(controller: appCtr.discountCtr, label: "Discount"),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => appCtr.isUpdate.value
              ? appCtr.updateProduct()
              : appCtr.addProduct(),
          child: Icon(appCtr.isUpdate.value ? Icons.edit : Icons.add),
        ),
      ),
    );
  }
}
