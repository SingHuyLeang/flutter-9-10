import 'package:get/get.dart';

class ThemeManager extends GetxController {
  RxBool isDark = false.obs;

  void toggleTheme() async {
    isDark.value = !isDark.value;
    update();
  }
}
