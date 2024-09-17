import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/database/note_db.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/util/helper/dt.dart';

class NoteController extends GetxController {
  final db = NoteDatabase();
  final titleCtr = TextEditingController();
  final contentCtr = TextEditingController();

  final notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  Future<void> reload() async {
    notes.clear();
    notes.addAll(await getNotes());
    update();
  }

  Future<void> addNote() async {
    if (titleCtr.text.isEmpty || contentCtr.text.isEmpty) {
      Get.snackbar("Note App", "Please enter all fields");
    } else if (await db.insert(Note(
      title: titleCtr.text,
      content: contentCtr.text,
      date: NDateTime.getCurrentDate(),
      time: NDateTime.getCurrentTime(),
    ))) {
      Get.snackbar("Note App", "Note saved successfully");
      titleCtr.clear();
      contentCtr.clear();
    } else {
      Get.snackbar("Note App", "Failed to save note");
    }
  }

  // get the notes
  Future<List<Note>> getNotes() async => await db.getNotes();
}
