import 'package:flutter/material.dart';
import 'package:kareem_portfolio/widgets/main_button.dart';
import 'package:sizer/sizer.dart';

class MainDeskTop extends StatelessWidget {
  const MainDeskTop({
    super.key,
    required this.screenSize,
    required this.screenWidth,
  });

  final Size screenSize;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: screenSize.height / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi\nI’m Kareem Tarek\nA Flutter Developer",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: screenWidth * .25,
                height: 50,
                child: MainButton(),
              ),
            ],
          ),
          Image.asset(
            "assets/images/my_flutter_avatar 1.png",
            width: screenWidth / 2,
          ),
        ],
      ),
    );
  }
}
