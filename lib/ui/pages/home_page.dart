import 'package:firebase_app/ui/pages/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.blue,
          onPressed: ()async =>await controller.addProduct(),
          child: Text("Add"),
        ),
      ),
    );
  }
}