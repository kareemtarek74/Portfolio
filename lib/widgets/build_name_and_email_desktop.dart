import 'package:flutter/material.dart';
import 'package:kareem_portfolio/widgets/custom_text_field.dart';

Row buildNameAndEmailFieldsDesktop(TextEditingController nameController,
    TextEditingController emailController) {
  return Row(
    children: [
      Flexible(
        child: CustomTextField(
          hintText: "Your Name",
          controller: nameController,
        ),
      ),
      SizedBox(width: 15),
      Flexible(
        child: CustomTextField(
          hintText: "Your Email",
          controller: emailController,
        ),
      ),
    ],
  );
}
