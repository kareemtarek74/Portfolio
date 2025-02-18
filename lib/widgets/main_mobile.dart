import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/widgets/main_button.dart';
import 'package:sizer/sizer.dart';

class MainMobile extends StatefulWidget {
  final Size screenSize;
  final double screenWidth;

  const MainMobile({
    super.key,
    required this.screenSize,
    required this.screenWidth,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  MainMobileState createState() => MainMobileState();
}

class MainMobileState extends State<MainMobile> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _floatingController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _floatingController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _floatingAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _controller.forward().then((_) {
      _floatingController.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenSize.height / 1.5,
      constraints: BoxConstraints(minHeight: 560),
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _floatingController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatingAnimation.value),
                child: child,
              );
            },
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: ShaderMask(
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
                  width: widget.screenWidth,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              "Hi\nI’m Kareem Tarek\nA Flutter Developer",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
              width: widget.screenWidth * .30,
              height: 50,
              child: MainButton(
                onPressed: widget.onPressed,
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _floatingController.dispose();
    super.dispose();
  }
}
