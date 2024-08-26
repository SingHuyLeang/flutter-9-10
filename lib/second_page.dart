import 'package:flutter/material.dart';
import 'package:flutter_9_10/bloc/data_bloc.dart';
import 'package:flutter_9_10/bloc/data_even.dart';
import 'package:flutter_9_10/bloc/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (_, state) {
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
                  'Data of state = ${state.data}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _.read<DataBloc>().add(DecrementEvents());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
