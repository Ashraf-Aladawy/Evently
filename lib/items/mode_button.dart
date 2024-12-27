import 'package:flutter/material.dart';

class ModeButton{
  static Widget modeButton(BuildContext context, {required bool mode}) {
    return Container(
        height: 30,
        width: 73,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(30)),
        child:
        _onSelectMode(context, mode: mode,));
  }

  static Widget _onSelectMode(BuildContext context,
      {required bool mode}) {
    return mode == false
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 3, color: Theme.of(context).primaryColor),
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Image.asset("assets/images/usa_icon.png")),
      Image.asset("assets/images/EG.png"),
    ])
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/usa_icon.png",),
        Container(

            decoration: BoxDecoration(
              border: Border.all(
                  width: 3, color: Theme.of(context).primaryColor),
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: Image.asset(
              "assets/images/EG.png",
            )),
      ],
    );
  }
}