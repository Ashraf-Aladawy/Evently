import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/firebase_functions.dart';
import 'package:evently_app/items/mode_button.dart';
import 'package:evently_app/screens/forget_pass_screen.dart';
import 'package:evently_app/screens/home_screen.dart';
import 'package:evently_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../items/text_filed_item.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LogInScreen";
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool langMode = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: TextFieldItem(
                  controller: emailController,
                  validate: () {},
                  lable: "Email",
                  prefixIcon:
                      ImageIcon(AssetImage("assets/images/email_icon.png")),
                ),
              ),
              TextFieldItem(
                controller: passwordController,
                validate: () {},
                lable: "Password",
                prefixIcon: ImageIcon(AssetImage("assets/images/lock.png")),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ForgetPassScreen.routeName);
                      },
                      child: Text(
                        "Forget Password?",
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
              ElevatedButton(
                  onPressed: () {
                    print(emailController);
                    FirebaseFunctions.logIn(
                      emailAddress: emailController.text,
                      password: passwordController.text,
                      onLoading: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Center(child: CircularProgressIndicator()),
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      },
                      onSuccess: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeScreen.routeName,
                          (route) => false,
                        );
                      },
                      onError: (massage) {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Some thing went Wrong"),
                            content: Text(massage),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ok")),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Log in",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t Have Account ?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        "Create Account",
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
                children: [
                  Expanded(
                      child: Divider(
                    color: Theme.of(context).primaryColor,
                    indent: 26,
                    endIndent: 16,
                  )),
                  Text(
                    "Or",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Color(0xff5669FF)),
                  ),
                  Expanded(
                      child: Divider(
                    color: Theme.of(context).primaryColor,
                    indent: 16,
                    endIndent: 24,
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: InkWell(
                  onTap: () {
                    FirebaseFunctions.signInWithGoogle();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google_icon.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Login With Google",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                  ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
