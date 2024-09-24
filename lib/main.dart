import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/app/home.dart';
import 'package:test/common/theme/controller/theme_controller.dart';
import 'package:test/common/theme/data/theme.dart';
import 'package:test/common/translate/controller/translate_controller.dart';
import 'package:test/common/translate/translater/translater.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeManager = Get.put(ThemeManager());
  final translateController = Get.put(TranslateController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeManager.isDark.value ? ThemeMode.dark : ThemeMode.light,
        translations: Translater(),
        locale: translateController.toggleLocal(),
        home: MyHomePage(),
      ),
    );
  }
}
