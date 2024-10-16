import 'package:firebase_app/ui/components/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final ctrEmail = TextEditingController();
  final ctrPassword = TextEditingController();
  final _auth = FirebaseAuth.instance;
  Future<void> signup() async {
    String email = ctrEmail.text;
    String password = ctrPassword.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      openLoading();
      try {
        final userCredentail = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredentail.user != null) {
          Get.snackbar("Authication", "Successfully");
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Authentication", e.message!);
      } finally {
        ctrEmail.clear();
        ctrPassword.clear();
        closeLoading();
      }
    } else {
      Get.snackbar('Authentication', "Please enter your email and password");
    }
  }

  Future<void> signin() async {
    String email = ctrEmail.text;
    String password = ctrPassword.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      openLoading();
      try {
        final userCredentail = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredentail.user != null) {
          Get.snackbar("Authentication", "Successfully");
        }
      } catch (e) {
        Get.snackbar("Authentication", "$e");
      } finally {
        ctrEmail.clear();
        ctrPassword.clear();
        closeLoading();
      }
    } else {
      Get.snackbar('Authentication', "Please enter your email and password");
    }
  }
}
