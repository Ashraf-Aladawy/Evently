import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  TextFieldItem(
      {super.key,
      required this.lable,
      this.prefixIcon = null,
      this.suffixIcon = null});
  String lable;
  Widget? prefixIcon;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
