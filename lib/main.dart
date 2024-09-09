import 'package:flutter/material.dart';
import 'package:note_app/features/views/screens/authentication/sign_in_screen.dart';
import 'package:note_app/features/views/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary!),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
