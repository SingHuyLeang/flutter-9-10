class Note {
  int? id;
  String title;
  String content;
  String date;
  String time;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "content": content,
        "date": date,
        "time": time,
      };

  factory Note.fromMap(Map<String, dynamic> data) {
    return Note(
      id: data["id"] as int?,
      title: data["title"] as String,
      content: data["content"] as String,
      date: data["date"] as String,
      time: data["time"] as String,
    );
  }
}
