import 'package:flutter/material.dart';
import 'package:note_app/context/context.dart';
import 'package:note_app/features/views/screens/authentication/components/header.dart';
import 'package:note_app/features/views/screens/components/button/button.dart';
import 'package:note_app/features/views/screens/components/fields/text_form.dart';
import 'package:note_app/features/views/theme/colors.dart';

import '../components/widgets/text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();
  final conPassCtr = TextEditingController();

  bool showPass = false; // mean eye is false
  bool showConPass = false; // mean eye is false

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
                header: "Sing Up",
                thumnail:
                    "Please enter your username & password to sign up your account.",
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
                suffix: !showPass ? "eye.png" : "eye-slash.png",
                keyboard: TextInputType.visiblePassword,
                hideText: showPass,
                toggleSuffix: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
              ),
              const SizedBox(height: 20),
              NFormField(
                controller: conPassCtr,
                hint: "Enter your confirm password",
                prefix: "lock.png",
                suffix: !showConPass ? "eye.png" : "eye-slash.png",
                keyboard: TextInputType.visiblePassword,
                hideText: showConPass,
                toggleSuffix: () {
                  setState(() {
                    showConPass = !showConPass;
                  });
                },
              ),
              const SizedBox(height: 40),
              // button
              NButton(
                onTap: () {
                  // TODO: implement logic
                },
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
                    child: NText(text: "Sign In",color: primary,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
