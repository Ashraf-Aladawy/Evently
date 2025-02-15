import 'package:flutter/material.dart';

import '../items/text_filed_item.dart';

class ForgetPassScreen extends StatelessWidget {
  static const String routeName = "forgetPassword";

  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/change-setting.png",
                height: 361,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: TextFieldItem(
                  validate: (){},
                  lable: "Email",
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/email_icon.png"),
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
            ]),
      ),
    );
  }
}
