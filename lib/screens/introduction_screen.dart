import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class IntoScreen extends StatefulWidget {
  static const String routeName = "introductionScreen";

  IntoScreen({super.key});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  @override
  bool langMode = false;
  bool themeMode = false;

  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/app_logo.png",
          width: 360,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/intro_image.png"),
              SizedBox(
                height: 28,
              ),
              Text(
                "intor_title".tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                "intor_discribtion".tr(),
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "language".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                      onTap: () {
                        langMode = !langMode;
                        if (langMode == false) {
                          context.setLocale(Locale("en"));
                        } else {
                          context.setLocale(Locale("ar"));
                        }
                        setState(() {});
                        print(langMode);
                      },
                      child: _modeButton(context,
                          mode: langMode, image1: "usa_icon", image2: "EG"))
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "theme".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                      onTap: () {
                        themeMode = !themeMode;
                        provider.changeTheme();
                        setState(() {});
                        print(themeMode);
                      },
                      child: _modeButton(context,
                          mode: themeMode, image1: "Sun", image2: "Moon"))
                ],
              ),
              SizedBox(
                height: 28,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, OnBoardingScreen.routeName);
                  },
                  child: Text(
                    "lets_start".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _modeButton(BuildContext context,
      {required bool mode, required String image1, required String image2}) {
    return Container(
        height: 30,
        width: 73,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(30)),
        child:
            _onSelectMode(context, mode: mode, image1: image1, image2: image2));
  }

  Widget _onSelectMode(BuildContext context,
      {required bool mode, required String image1, required String image2}) {
    return mode == false
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).primaryColor,
                ),
                child: Image.asset("assets/images/$image1.png")),
            Image.asset("assets/images/$image2.png"),
          ])
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/$image1.png",
                  color: image1 == "Sun" ? Colors.amber : null),
              Container(
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Image.asset(
                    "assets/images/$image2.png",
                  )),
            ],
          );
  }
}
