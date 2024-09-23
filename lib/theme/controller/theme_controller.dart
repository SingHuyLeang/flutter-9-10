import 'package:get/get.dart';
import 'package:test/theme/data/theme.dart';

class ThemeManager extends GetxController {
  RxBool isDark = false.obs;

  void toggleTheme() async {
    isDark.value = !isDark.value;
    update();
  }
}
