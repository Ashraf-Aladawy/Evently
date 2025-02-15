

import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  TextFieldItem(
      {super.key,
      required this.lable,
      this.prefixIcon = null,
      this.suffixIcon = null,
        this.controller,
        required this.validate,
        this.isObscure=false,

      });
  String lable;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;
  Function validate;
  bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate(value),
      controller:controller ,
      obscureText: isObscure ,
      decoration: InputDecoration(
        hintText: lable,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
