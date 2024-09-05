import 'package:flutter/material.dart';
import 'package:flutter_9_10/data/note.dart';
import 'package:flutter_9_10/db/db.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = DB();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Note>>(
        stream: db.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 40,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasData) {
            return app(context, snapshot.data!);
          } else {
            return const Center(
              child: Text('No tasks found.'),
            );
          }
        });
  }

  Scaffold app(BuildContext context, List<Note> notes) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo.shade800),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: textController,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add a task',
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        if (textController.text.isEmpty) {
                          Get.showSnackbar(const GetSnackBar(
                            message: "Please enter task!",
                            duration: Duration(milliseconds: 800),
                          ));
                        } else if (await db.addTask(textController.text)) {
                          Get.showSnackbar(const GetSnackBar(
                            message: "Add Success",
                            duration: Duration(milliseconds: 800),
                          ));
                          setState(() {
                            textController.clear();
                          });
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            message: "Add Failed",
                            duration: Duration(milliseconds: 800),
                          ));
                        }
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ...List.generate(
                notes.length,
                (index) => card(notes[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container card(Note note) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            note.task,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () =>
                    textController.text = '${note.id} - ${note.task}',
                icon: Icon(
                  Icons.edit,
                  color: Colors.indigo[800],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
