import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/theme/controller/theme_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final themeManager = Get.put(ThemeManager());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("Flutter demo switcher theme"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () async => themeManager.toggleTheme(),
                child: Text(
                  'Swich to ${themeManager.isDark.value ? 'dark' : 'light'}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
