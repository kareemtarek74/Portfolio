import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Text(
        "Made by Kareem Tarek with Flutter",
        style: TextStyle(
            fontWeight: FontWeight.w400, color: CustomColor.whiteSecondary),
      ),
    );
  }
}
