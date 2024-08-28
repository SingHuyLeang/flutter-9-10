import 'dart:developer';

import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() async {
    count.value++;
    log('count ${count.value}');
    update();
  }
  void decrement() async {
    count.value--;
    log('count ${count.value}');
    update();
  }
}