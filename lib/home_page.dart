import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_9_10/bloc/data_bloc.dart';
import 'package:flutter_9_10/bloc/data_even.dart';
import 'package:flutter_9_10/bloc/data_state.dart';
import 'package:flutter_9_10/second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc,DataState>(
      builder: (_,state) {
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
                  'Data of state = ${state.data}',
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
            onPressed: () {
              _.read<DataBloc>().add(IncrementEvents());
            },
            child: const Icon(Icons.add),
          ),
        );
      }
    );
  }
}
