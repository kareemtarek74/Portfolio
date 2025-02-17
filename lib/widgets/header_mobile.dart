import 'package:flutter/material.dart';
import 'package:kareem_portfolio/styles/app_styles.dart';
import 'package:kareem_portfolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    required this.onLogoTap,
    required this.onMenuTap,
  });
  final void Function() onLogoTap;
  final void Function() onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
          Spacer(),
          IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu)),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
