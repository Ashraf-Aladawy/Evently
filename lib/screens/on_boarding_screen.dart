import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/cache_helper/cache_helper.dart';
import 'package:evently_app/screens/introduction_screen.dart';
import 'package:evently_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../models/boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoardingScreen";

  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/app_logo.png"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 25, bottom: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(BoardingModel.boardingItems[index].image),
            SizedBox(
              height: 35,
            ),
            Text(
              BoardingModel.boardingItems[index].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              BoardingModel.boardingItems[index].body,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index == 0
                    ? SizedBox()
                    : _arrowBtn(context, icon: Icons.arrow_back, onCilcked: () {
                        if (index > 0) {
                          index--;
                          setState(() {});
                          print(index);
                        }
                      }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    index == 0
                        ? _selectedtPoint(context)
                        : _unSelectedtPoint(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: index == 1
                          ? _selectedtPoint(context)
                          : _unSelectedtPoint(context),
                    ),
                    index == 2
                        ? _selectedtPoint(context)
                        : _unSelectedtPoint(context),
                  ],
                ),
                _arrowBtn(context, icon: Icons.arrow_forward, onCilcked: () {
                  if (index < 2) {
                    index++;
                  } else {
                    CacheHelper.saveOnBording();
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  }

                  setState(() {});
                  print(index);
                })
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _selectedtPoint(BuildContext context) {
    return Container(
      height: 8,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _unSelectedtPoint(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Theme.of(context).dividerColor,
      ),
    );
  }

  Widget _arrowBtn(BuildContext context,
      {required IconData icon, required Function onCilcked}) {
    return IconButton(
      onPressed: () {
        onCilcked();
      },
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(25),
          )),
    );
  }
}
