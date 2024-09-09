import 'package:flutter/material.dart';
import 'package:note_app/features/views/screens/components/widgets/text.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.header, required this.thumnail});

  final String header, thumnail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NText(
          text: header,
          size: 40,
          font: 'bold',
        ),
        const SizedBox(height: 15),
        NText(
          text: thumnail,
          textAlign: TextAlign.center,
          size: 16,
        ),
      ],
    );
  }
}
