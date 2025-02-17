import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({
    super.key,
    required this.screenSize,
    required this.screenWidth,
  });

  final Size screenSize;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
      constraints: BoxConstraints(minHeight: 560),
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  CustomColor.scaffoldBg.withOpacity(.6),
                  CustomColor.scaffoldBg.withOpacity(0.6)
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/images/my_flutter_avatar 1.png",
              width: screenWidth,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Hi\nI’m Kareem Tarek\nA Flutter Developer",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: screenWidth * .30,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Get in touch",
                  style: TextStyle(
                      fontSize: 13.sp, color: CustomColor.whitePrimary),
                )),
          ),
        ],
      ),
    );
  }
}
