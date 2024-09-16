import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/controller/note_controller.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/features/views/components/widgets/text.dart';
import 'package:note_app/features/views/note/add_update_screen.dart';
import 'package:note_app/features/views/note/components/card.dart';
import 'package:note_app/util/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Note>>(
      stream: Stream.fromFuture(controller.getNotes()),
      builder: (_, snapshot) {
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
          body: Obx(
            () => Visibility(
              visible: true.obs.value,
              child: homeContent(snapshot),
            ),
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

  Widget homeContent(AsyncSnapshot<List<Note>> snapshot) {
    if (snapshot.hasError) {
      return const SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.red, size: 30),
            SizedBox(height: 24),
            Text(
              'Error fetching notes',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ],
        ),
      );
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(
          color: primary,
        ),
      );
    } else if (snapshot.data == null) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note, color: primary, size: 30),
            const SizedBox(height: 24),
            const Text(
              "Don't have notes",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return noteCard(snapshot.data![index]);
        },
      );
    }
  }
}
