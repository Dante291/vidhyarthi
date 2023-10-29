import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyarthi/rounded_small_button.dart';
import 'package:flutter/gestures.dart';

import 'auth_controller.dart';
import 'auth_text_field.dart';
import 'loading_indicator.dart';

class loginScreen extends ConsumerStatefulWidget {
  const loginScreen({super.key});

  @override
  ConsumerState<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends ConsumerState<loginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onlogIn() {
    FocusScope.of(context).unfocus();
    ref.read(authControllerProvider.notifier).logIn(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isloading = ref.watch(authControllerProvider);
    return Scaffold(
      body: isloading
          ? const loadingPage()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  Image.asset(
                      'assets/Gray and Beige Elegant Typographic Restaurant Logo (1).png'),
                  AuthTextField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onTap: onlogIn,
                      label: 'LogIn',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' Sign Up',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const loginScreen(),
                                ));
                              },
                          )
                        ]),
                  )
                ]),
              ),
            ),
    );
  }
}
