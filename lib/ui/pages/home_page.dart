import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/ui/pages/controller.dart';
import 'package:firebase_app/ui/pages/form_page.dart';
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
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.firestore.firestoreSnapshots,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Icon(Icons.error, size: 32, color: Colors.red),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No documents found'),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              final data = snapshot.data!.docs ;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final doc = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(doc['name'] as String),
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => FormProductPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
