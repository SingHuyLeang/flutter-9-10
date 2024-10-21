import 'package:firebase_app/ui/pages/controller.dart';
import 'package:firebase_app/ui/pages/form_page.dart';
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => FormProductPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
