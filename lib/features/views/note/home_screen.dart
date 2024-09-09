import 'package:flutter/material.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/views/components/widgets/text.dart';
import 'package:note_app/features/views/note/add_update_screen.dart';
import 'package:note_app/util/theme/colors.dart';

import 'components/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const NText(
          text: 'Note App',
          font: 'bold',
          size: 26,
          color: tertiary,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => card(),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Go.to(context, const AddAndUpdateScreen()),
        child: CircleAvatar(
          backgroundColor: primary,
          radius: 26,
          child: const Icon(Icons.add, color: tertiary),
        ),
      ),
    );
  }
}
