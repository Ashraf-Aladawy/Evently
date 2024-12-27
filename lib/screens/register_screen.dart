import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName="registerScreen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Logo.png",
              height: 186,
              alignment: Alignment.topCenter,
            ),
                  ]
        ),
      ),
    );
  }
}
