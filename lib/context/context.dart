import 'package:flutter/material.dart';

class Go {
  static void to(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
