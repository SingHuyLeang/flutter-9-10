import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/theme/controller/theme_controller.dart';
import 'package:test/common/translate/controller/translate_controller.dart';
import 'package:test/common/translate/translater/translate_keys.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final themeManager = Get.put(ThemeManager());
  final translateController = Get.put(TranslateController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(TranslateKeys.flutterDemoSwitcherTheme.tr),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(TranslateKeys.language.tr),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () async => themeManager.toggleTheme(),
                child: Text(
                  themeManager.isDark.value
                      ? TranslateKeys.switchToLight.tr
                      : TranslateKeys.switchToDark.tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () async => translateController.toggleLanguage(),
                child: Text(
                  translateController.toggleTextTranslateButton(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
