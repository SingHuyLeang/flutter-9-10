import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final ctrEmail = TextEditingController();
  final ctrPassword = TextEditingController();

  Future<void> signup() async {
    String email = ctrEmail.text;
    String password = ctrPassword.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final userCredentail = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredentail.user != null) {
          Get.snackbar("Authication", "Successfully");
        }
      } on FirebaseAuthException catch (e) {
        log("FirebaseAuthException An error occurred: ${e.message}");
      }
    } else {
      Get.snackbar('Authentication', "Please enter your email and password");
    }
  }
}
