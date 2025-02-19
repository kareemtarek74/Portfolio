import 'package:flutter/material.dart';
import 'package:kareem_portfolio/widgets/custom_text_field.dart';

Column buildNameAndEmailFieldsMobile(TextEditingController nameController,
    TextEditingController emailController) {
  return Column(
    children: [
      Flexible(
        child: CustomTextField(
          hintText: "Your Name",
          controller: nameController,
        ),
      ),
      SizedBox(height: 15),
      Flexible(
        child: CustomTextField(
          hintText: "Your Email",
          controller: emailController,
        ),
      ),
    ],
  );
}
