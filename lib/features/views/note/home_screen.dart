import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/controller/note_controller.dart';
import 'package:note_app/features/views/components/widgets/text.dart';
import 'package:note_app/features/views/note/add_update_screen.dart';
import 'package:note_app/features/views/note/components/card.dart';
import 'package:note_app/util/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const NText(
          text: 'Note App',
          font: 'bold',
          size: 26,
          color: tertiary,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: secondary,
              size: 26,
            ),
            onPressed: () async => controller.reload(),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.notes.isEmpty) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.note, color: primary, size: 30),
                  const SizedBox(height: 24),
                  const Text(
                    "Don't have notes",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                final note = controller.notes[index];
                return noteCard(
                  note,
                  onTap: ()=> controller.toUpdate(index),
                  onLongTap: () {
                    Get.bottomSheet(
                      isDismissible: true,
                      enableDrag: true,
                      DraggableScrollableSheet(
                        initialChildSize: 0.3,
                        minChildSize: 0.1,
                        maxChildSize: 0.5,
                        builder: (_, scrollController) => Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.deleteNote(index);
                                  Get.back();
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 1.5,
                                      color: const Color(0xFFFFF4F4),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: const NText(
                                    text: "Delete",
                                    color: Colors.red,
                                    font: 'bold',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 1.5,
                                      color: const Color(0xFFFFF4F4),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: const NText(
                                    text: "Cancel",
                                    font: 'bold',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Go.to(context, AddAndUpdateScreen()),
        child: CircleAvatar(
          backgroundColor: primary,
          radius: 26,
          child: const Icon(Icons.add, color: tertiary),
        ),
      ),
    );
  }
}
