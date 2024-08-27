import 'package:flutter/material.dart';
import 'package:flutter_9_10/provider/data.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataState(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            surface: Colors.blue.shade500,
            onSurface: Colors.white,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
