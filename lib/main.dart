import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/features/views/authentication/sign_in_screen.dart';
import 'package:note_app/util/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary!),
        useMaterial3: true,
      ),
      home: SignInScreen(),
    );
  }
}
