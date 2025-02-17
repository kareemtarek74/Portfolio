import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/nav_items.dart';
import 'package:kareem_portfolio/styles/app_styles.dart';
import 'package:kareem_portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {},
          ),
          Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            TextButton(
                onPressed: () {},
                child: Text(
                  navTitles[i],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whitePrimary),
                )),
          SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }
}
