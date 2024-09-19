import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/database/note_db.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/features/views/note/add_update_screen.dart';
import 'package:note_app/features/views/note/home_screen.dart';
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

  // delete the notes
  Future<void> deleteNote(int index) async {
    if (await db.deleteNote(notes[index])) {
      Get.snackbar("Note App", "Note deleted successfully");
      notes.removeAt(index);
    } else {
      Get.snackbar("Note App", "Failed to delete note");
    }
  }

  // update the notes
  Future<void> updateNote(int oldId) async {
    log('oldId $oldId');
    if (titleCtr.text.isEmpty || contentCtr.text.isEmpty) {
      Get.snackbar("Note App", "Please enter all fields");
    } else {
      final sucess = await db.updateNote(
        oldId,
        Note(
          title: titleCtr.text,
          content: contentCtr.text,
          date: NDateTime.getCurrentDate(),
          time: NDateTime.getCurrentTime(),
        ),
      );
      Get.snackbar(
        "Note App",
        sucess ? "Note updated successfully" : "Failed to update note",
      );
      if (sucess) {
        titleCtr.clear();
        contentCtr.clear();
        Get.to(HomeScreen());
      }
    }
  }

  // to update the notes
  void toUpdate(int index) async {
    Get.to(() => AddAndUpdateScreen(note: notes[index]));
    titleCtr.text = notes[index].title;
    contentCtr.text = notes[index].content;
    update();
  }
}
