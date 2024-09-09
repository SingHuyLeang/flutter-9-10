import 'package:flutter/material.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/views/authentication/components/header.dart';
import 'package:note_app/features/views/authentication/sign_up_screen.dart';
import 'package:note_app/features/views/components/button/button.dart';
import 'package:note_app/features/views/components/fields/text_form.dart';
import 'package:note_app/util/theme/colors.dart';

import '../components/widgets/text.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();

  bool toggleSuffix = false; // mean eye is open

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                controller: emailCtr,
                hint: "Enter your username",
                prefix: "mail.png",
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              NFormField(
                controller: passCtr,
                hint: "Enter your password",
                prefix: "lock.png",
                suffix: !toggleSuffix ? "eye.png" : "eye-slash.png",
                keyboard: TextInputType.visiblePassword,
                hideText: toggleSuffix,
                toggleSuffix: () {
                  toggleSuffix = !toggleSuffix;
                },
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
    );
  }
}
