import 'package:flutter/material.dart';
import 'package:flutter_9_10/provider/data.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Page'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DataState>().descrementCount(),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
