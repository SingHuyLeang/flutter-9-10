import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class UserDatabase {
  final String database = "user.db";
  final String table = "users";
  final String id = "id";
  final String username = "username";
  final String password = "password";

  Future<Database> init() async {
    late Database db;

    try {
      String path = await getDatabasesPath();
      db = await openDatabase(
        "$path/$database",
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            "CREATE TABLE IF NOT EXISTS $table ($id INTEGER PRIMARY KEY AUTOINCREMENT,$username TEXT NOT NULL,$password TEXT NOT NULL)",
          );
        },
      );
    } catch (e) {
      log("init db : $e");
    }
    return db;
  }
}
