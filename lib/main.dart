import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          surface: Color(0xFF1A237E),
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A237E),
          centerTitle: true,
          elevation: 10,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xFF1A237E),
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            color: Color(0xFF6A6B76),
            fontSize: 18,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
