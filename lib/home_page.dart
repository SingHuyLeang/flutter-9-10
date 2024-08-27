import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_9_10/provider/data.dart';
import 'package:flutter_9_10/second_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // State
            Text(
              'Data of state = ${context.watch<DataState>().count}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            // goto second page
            CupertinoButton(
              color: Colors.indigo[800],
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              ),
              child: const Text(
                'Watch Second page',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DataState>().incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
