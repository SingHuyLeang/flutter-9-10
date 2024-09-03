import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_9_10/db/db.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final db = DB();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo.shade800),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: textController,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add a task',
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        if (textController.text.isEmpty) {
                          Get.showSnackbar(const GetSnackBar(
                            message: "Please enter task!",
                            duration: Duration(milliseconds: 800),
                          ));
                        } else if (await db.addTask(textController.text)) {
                          Get.showSnackbar(const GetSnackBar(
                            message: "Add Success",
                            duration: Duration(milliseconds: 800),
                          ));
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            message: "Add Failed",
                            duration: Duration(milliseconds: 800),
                          ));
                        }
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ...List.generate(
                20,
                (index) => card("Card simple"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container card(String data) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.indigo[800],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
