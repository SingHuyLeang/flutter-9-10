import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  final String table = "tasks";
  final String id = "id";
  final String task = "task";

  Stream<List<String>> get stream => Stream.fromFuture(getTasks());

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

  Future<List<String>> getTasks() async {
    final db = await init();
    final data = await db.rawQuery("SELECT * FROM $table");
    return data.map((e) => e[task].toString()).toList();
  }
}
