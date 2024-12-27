import 'package:evently_app/items/text_filed_item.dart';
import 'package:evently_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../items/mode_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "registerScreen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool langMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("register"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Logo.png",
                height: 186,
                alignment: Alignment.topCenter,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                child: TextFieldItem(
                  lable: "Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFieldItem(
                  lable: "Email",
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/email_icon.png"),
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFieldItem(
                  lable: "Password",
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/lock.png"),
                    color: Theme.of(context).cardColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFieldItem(
                  lable: "Re Password",
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/lock.png"),
                    color: Theme.of(context).cardColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Create Account",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ? ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Color(0xff5669FF),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff5669FF),
                            decorationThickness: 2),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () {
                        langMode = !langMode;
                        setState(() {});
                      },
                      child: ModeButton.modeButton(context, mode: langMode)),
                ],
              ),
            ]),
      ),
    );
  }
}
