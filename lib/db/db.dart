import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_9_10/data/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  final String table = "tasks";
  final String id = "id";
  final String task = "task";

  Stream<List<Note>> get stream => Stream.fromFuture(getTasks());

  Future<Database> init() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      return await openDatabase(
        "${dir.path}/data.db",
        version: 1,
        onCreate: (db, version) => db.execute(
          "CREATE TABLE IF NOT EXISTS $table ($id INTEGER PRIMARY KEY AUTOINCREMENT,$task TEXT)",
        ),
        onUpgrade: (db, oldVersion, newVersion) {
          db.execute("DROP TABLE IF EXISTS $table");
        },
      );
    } catch (e) {
      log('Error initializing database: $e');
      rethrow;
    }
  }

  Future<bool> addTask(String task) async {
    int i = 0;
    try {
      final db = await init();
      i = await db.insert(table, {this.task: task});
    } catch (e) {
      log('Error adding task: $e');
    }
    return i > 0;
  }

  Future<List<Note>> getTasks() async {
    final db = await init();
    final data = await db.rawQuery("SELECT * FROM $table");
    return data.map((e) => Note.fromMap(e)).toList();
  }

  Future<bool> updateTask(Note note) async {
    final db = await init();
    int i = await db.update(
      table,
      {task: note.task},
      where: "$id = ?",
      whereArgs: [note.id],
    );
    return i > 0;
  }

  Future<bool> deleteTask(int id) async {
    final db = await init();
    int i = await db.delete(table, where: "${this.id} = ?", whereArgs: [id]);
    return i > 0;
  }
}
