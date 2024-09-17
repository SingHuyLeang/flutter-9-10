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
                return noteCard(note);
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
