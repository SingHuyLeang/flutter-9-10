import 'dart:developer';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  Future<Database> init() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      return await openDatabase(
        "${dir.path}/data.db",
        version: 1,
        onCreate: (db, version) => db.execute(
          "CREATE TABLE IF NOT EXISTS tasks (id INTEGER PRIMARY KEY,task TEXT)",
        ),
      );
    } catch (e) {
      log('Error initializing database: $e');
      rethrow;
    }
  }
}
