import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/controller/user_controller.dart';
import 'package:note_app/features/views/authentication/components/header.dart';
import 'package:note_app/features/views/authentication/sign_up_screen.dart';
import 'package:note_app/features/views/components/button/button.dart';
import 'package:note_app/features/views/components/fields/text_form.dart';
import 'package:note_app/util/theme/colors.dart';

import '../components/widgets/text.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

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
                    header: "Sing In",
                    thumnail:
                        "Please enter your username & password to sign in your account.",
                  ),
                  // -- form --
                  const SizedBox(height: 40),
                  NFormField(
                    controller: controller.signInEmailCtr,
                    hint: "Enter your username",
                    prefix: "mail.png",
                    keyboard: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  NFormField(
                    controller: controller.signInPassCtr,
                    hint: "Enter your password",
                    prefix: "lock.png",
                    suffix: !controller.showPass.value
                        ? "eye.png"
                        : "eye-slash.png",
                    keyboard: TextInputType.visiblePassword,
                    hideText: controller.showPass.value,
                    toggleSuffix: () async => controller.toggleShowPass(),
                  ),
                  const SizedBox(height: 40),
                  // button
                  NButton(
                    onTap: () {
                      // TODO: implement logic
                    },
                    text: "Sign In",
                    width: 180,
                  ),
                  // switcher
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const NText(text: "Don't have an account?"),
                      TextButton(
                        onPressed: () => Go.to(context, SignUpScreen()),
                        child: NText(
                          text: "Sign Up",
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
