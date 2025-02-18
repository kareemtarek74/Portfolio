import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.controller, this.maxLines = 1, this.hintText});
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(
        color: CustomColor.scaffoldBg,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whiteSecondary,
          focusedBorder: contactBorder(),
          enabledBorder: contactBorder(),
          border: contactBorder(),
          hintText: hintText,
          hintStyle: TextStyle(color: CustomColor.hintDark)),
    );
  }
}

OutlineInputBorder contactBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
}
