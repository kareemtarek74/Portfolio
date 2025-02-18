import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.yellowPrimary,
            elevation: 10,
            shadowColor: CustomColor.yellowPrimary.withOpacity(0.5)),
        onPressed: () {},
        child: Text(
          "Get in touch",
          style: TextStyle(color: CustomColor.whitePrimary),
        ));
  }
}
