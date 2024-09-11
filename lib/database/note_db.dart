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
}
