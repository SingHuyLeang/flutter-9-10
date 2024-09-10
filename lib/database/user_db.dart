import 'dart:developer';

import 'package:note_app/features/model/user.dart';
import 'package:sqflite/sqflite.dart';

interface class UserDatabase {
  String database = "user.db";
  String table = "users";
  String id = "id";
  String username = "username";
  String password = "password";

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
    } on DatabaseException catch (e) {
      log("error init database : $e");
    }
    return db;
  }

  Future<bool> createUser(User user) async {
    try {
      final db = await init();
      return await db.insert(table, user.toMap()) > 0;
    } on DatabaseException catch (e) {
      log("on create user : $e");
    }
    return false;
  }
}
