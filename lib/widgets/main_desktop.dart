import 'package:flutter/material.dart';
import 'package:kareem_portfolio/widgets/main_button.dart';
import 'package:sizer/sizer.dart';

class MainDeskTop extends StatefulWidget {
  final Size screenSize;
  final double screenWidth;

  const MainDeskTop({
    super.key,
    required this.screenSize,
    required this.screenWidth,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  MainDeskTopState createState() => MainDeskTopState();
}

class MainDeskTopState extends State<MainDeskTop>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _floatingController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
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

    _slideAnimation = Tween<Offset>(
      begin: Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: widget.screenSize.height / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi\nI’m Kareem Tarek\nA Flutter Developer",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: SizedBox(
                      width: widget.screenWidth * .25,
                      height: 50,
                      child: MainButton(
                        onPressed: widget.onPressed,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
              child: Image.asset(
                "assets/images/my_flutter_avatar 1.png",
                width: widget.screenWidth / 2,
              ),
            ),
          ),
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
