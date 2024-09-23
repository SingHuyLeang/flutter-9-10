import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/home.dart';
import 'package:test/theme/controller/theme_controller.dart';
import 'package:test/theme/data/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeManager = Get.put(ThemeManager());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeManager.isDark.value ? ThemeMode.dark : ThemeMode.light,
        home: MyHomePage(),
      ),
    );
  }
}
