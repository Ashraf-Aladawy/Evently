import 'package:evently_app/firebase_functions.dart';
import 'package:evently_app/items/mode_button.dart';
import 'package:evently_app/items/text_filed_item.dart';
import 'package:evently_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "registerScreen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool langMode = false;
  bool isObscure = false;
  bool isObscure2 = false;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
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
                      validate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Name required";
                        }
                      },
                      controller: nameController,
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
                      validate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Email required";
                        }
                        final bool emailFormate = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (emailFormate == false) {
                          return "Invalid email format";
                        }
                        return null;
                      },
                      controller: emailController,
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
                      validate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Password required";
                        }
                        if (passwordController.text.length < 6) {
                          return "Password must be more than 6 character";
                        }
                        return null;
                      },
                      controller: passwordController,
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/lock.png"),
                        color: Theme.of(context).cardColor,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isObscure = !isObscure;
                          setState(() {});
                        },
                        child: Icon(
                          isObscure == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      isObscure: isObscure,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFieldItem(
                      lable: "Re Password",
                      validate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "ReEnter password";
                        }
                        if (passwordController.text != value) {
                          return "Password hasn't match";
                        }
                        return null;
                      },
                      controller: rePasswordController,
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/lock.png"),
                        color: Theme.of(context).cardColor,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isObscure2 = !isObscure2;
                          setState(() {});
                        },
                        child: Icon(
                          isObscure2 == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      isObscure: isObscure2,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseFunctions.createAccount(
                            name: nameController.text,
                            emailAddress: emailController.text,
                            password: passwordController.text,
                            onLoading: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Center(
                                      child: CircularProgressIndicator()),
                                  backgroundColor: Colors.transparent,
                                ),
                              );
                            },
                            onSuccess: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
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
                        }
                      },
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
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
                          child:
                              ModeButton.modeButton(context, mode: langMode)),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
