import 'package:flutter/material.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/views/components/widgets/text.dart';
import 'package:note_app/util/theme/colors.dart';

import '../components/fields/text_form.dart';

class AddAndUpdateScreen extends StatefulWidget {
  const AddAndUpdateScreen({super.key});

  @override
  State<AddAndUpdateScreen> createState() => _AddAndUpdateScreenState();
}

class _AddAndUpdateScreenState extends State<AddAndUpdateScreen> {
  final titleCtr = TextEditingController();
  final contentCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () => Go.back(context),
          icon: Icon(
            Icons.adaptive.arrow_back_rounded,
            color: tertiary,
          ),
        ),
        title: const NText(
          text: 'back',
          size: 20,
          color: tertiary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView(
          children: [
            // -- form --
            const SizedBox(height: 40),
            NFormField(
              controller: titleCtr,
              hint: "Enter your title",
              keyboard: TextInputType.text,
            ),
            const SizedBox(height: 20),
            NFormField(
              height: 400,
              maxLines: null,
              alignment: Alignment.topLeft,
              controller: contentCtr,
              hint: "Enter your content",
              keyboard: TextInputType.multiline,
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: primary,
        radius: 26,
        child: const Icon(Icons.add, color: tertiary),
      ),
    );
  }
}
