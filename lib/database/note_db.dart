import 'dart:developer';

import 'package:note_app/features/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDatabase {
  final String database = "note.db";
  final String table = "notes";
  final String id = "id";
  final String title = "title";
  final String content = "content";
  final String date = "date";
  final String time = "time";

  Future<Database> init() async {
    final path = await getDatabasesPath();
    return openDatabase(
      "$path/$database",
      version: 1,
      onCreate: (db, version) => db.execute(
          "CREATE TABLE IF NOT EXISTS $table ($id INTEGER PRIMARY KEY AUTOINCREMENT, $title TEXT, $content TEXT, $date TEXT, $time TEXT)"),
    );
  }

  // insert
  Future<bool> insert(Note note) async {
    try {
      final db = await init();
      return await db.insert(table, note.toMap()) > 0;
    } on DatabaseException catch (e) {
      log('DatabaseException caught in insert operation on $e');
    }
    return false;
  }
  // gets the note
  Future<List<Note>> getNotes() async {
    try {
      final db = await init();
      final query = "SELECT * FROM $table ORDER BY $date DESC, $time DESC";
      final rows = await db.rawQuery(query);
      return rows.map((row) => Note.fromMap(row)).toList();
    } on DatabaseException catch (e) {
      log('DatabaseException caught in getNotes operation on $e');
    }
    return [];
  }
}
