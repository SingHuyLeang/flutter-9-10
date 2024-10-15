
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> openLoading() async {
  await Future.delayed(Duration.zero,
      () => Get.dialog(circularProgressIndicator(), barrierDismissible: false));
}

Center circularProgressIndicator({double? value}) => Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          backgroundColor: const Color(0xFFC3C0C0),
          color: Theme.of(Get.context!).colorScheme.primary,
          value: value,
        ),
      ),
    );

void closeLoading() => Get.close(0);
