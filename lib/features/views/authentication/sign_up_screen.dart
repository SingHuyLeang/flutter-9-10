import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/controller/user_controller.dart';
import 'package:note_app/features/views/authentication/components/header.dart';
import 'package:note_app/features/views/components/button/button.dart';
import 'package:note_app/features/views/components/fields/text_form.dart';
import 'package:note_app/util/theme/colors.dart';

import '../components/widgets/text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.put(UserController());
  final visible = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Visibility(
            visible: visible.value,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // -- heaader --
                  const HeaderAuth(
                    header: "Sing Up",
                    thumnail:
                        "Please enter your username & password to sign up your account.",
                  ),
                  // -- form --
                  const SizedBox(height: 40),
                  NFormField(
                    controller: controller.signUpEmailCtr,
                    hint: "Enter your username",
                    prefix: "mail.png",
                    keyboard: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  NFormField(
                    controller: controller.signUpPassCtr,
                    hint: "Enter your password",
                    prefix: "lock.png",
                    suffix: !controller.showPass.value
                        ? "eye.png"
                        : "eye-slash.png",
                    keyboard: TextInputType.visiblePassword,
                    hideText: controller.showPass.value,
                    toggleSuffix: () async => controller.toggleShowPass(),
                  ),
                  const SizedBox(height: 20),
                  NFormField(
                    controller: controller.signUpConPassCtr,
                    hint: "Enter your confirm password",
                    prefix: "lock.png",
                    suffix: !controller.showConPass.value
                        ? "eye.png"
                        : "eye-slash.png",
                    keyboard: TextInputType.visiblePassword,
                    hideText: controller.showConPass.value,
                    toggleSuffix: () async => controller.toggleConShowPass(),
                  ),
                  const SizedBox(height: 40),
                  // button
                  NButton(
                    onTap: () async => controller.signUp(),
                    text: "Sign Up",
                    width: 180,
                  ),
                  // switcher
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const NText(text: "Don't have an account?"),
                      TextButton(
                        onPressed: () => Go.back(context),
                        child: NText(
                          text: "Sign In",
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
