import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/database/user_db.dart';
import 'package:note_app/features/views/note/home_screen.dart';

import '../model/user.dart';

class UserController extends GetxController {
  final db = UserDatabase();

  final signInEmailCtr = TextEditingController();
  final signInPassCtr = TextEditingController();

  final signUpEmailCtr = TextEditingController();
  final signUpPassCtr = TextEditingController();
  final signUpConPassCtr = TextEditingController();

  RxBool showPass = false.obs; // mean eye is false
  RxBool showConPass = false.obs; // mean eye is false

  void toggleShowPass() async {
    showPass.value = !showPass.value;
    update();
  }

  void toggleConShowPass() async {
    showConPass.value = !showConPass.value;
    update();
  }

  Future<void> signUp() async {
    if (signUpEmailCtr.text.isEmpty ||
        signUpPassCtr.text.isEmpty ||
        signUpConPassCtr.text.isEmpty) {
      Get.snackbar(
        'Note App',
        'All fields are required',
        duration: const Duration(seconds: 2),
      );
      return;
    } else if (signUpPassCtr.text != signUpConPassCtr.text) {
      Get.snackbar(
        'Note App',
        'Passwords do not match',
        duration: const Duration(seconds: 2),
      );
      return;
    } else if (await db.createUser(
        User(username: signUpEmailCtr.text, password: signUpPassCtr.text))) {
      Get.snackbar(
        'Note App',
        'User created successfully',
        duration: const Duration(seconds: 2),
      );
      signUpEmailCtr.clear();
      signUpPassCtr.clear();
      signUpConPassCtr.clear();
      Get.to(() => HomeScreen());
    } else {
      Get.snackbar(
        'Note App',
        'Can not create user',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
