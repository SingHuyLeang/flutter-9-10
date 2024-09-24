import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  RxBool english = true.obs;

  void toggleLanguage() async {
    english.value = !english.value;
    await Get.updateLocale(toggleLocal());
    toggleLocal();
    update();
  }

  Locale toggleLocal() {
    return english.value ? const Locale("en", "US") : const Locale("KH", "KH");
  }

  String toggleTextTranslateButton() {
    return english.value ? "ប្ដូរទៅភាសាខ្មែរ" : "Change to English";
  }
}
