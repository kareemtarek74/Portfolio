import 'package:flutter/material.dart';

Widget buildSuccessMessage() {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: Colors.green.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      "Thank you! Your message has been sent successfully. I'll get back to you soon.",
      style: TextStyle(color: Colors.green[700]),
      textAlign: TextAlign.center,
    ),
  );
}
