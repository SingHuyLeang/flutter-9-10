import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/controller/note_controller.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/features/views/components/widgets/text.dart';
import 'package:note_app/features/views/note/add_update_screen.dart';
import 'package:note_app/util/theme/colors.dart';

import 'components/card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Note>>(
      stream: null,
      builder: (context, snapshot) {
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
          ),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => card(),
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
      },
    );
  }
}
