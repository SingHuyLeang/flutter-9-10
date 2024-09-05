class Note {
  int id;
  String task;

  Note({required this.id, required this.task});

  Note.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        task = map["task"];

  Map<String, dynamic> toMap() => {
        "id": id,
        "task": task,
      };
}
