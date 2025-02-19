import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';

class MainButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final double fontSize;
  const MainButton({super.key, this.onPressed, required this.fontSize});

  @override
  MainButtonState createState() => MainButtonState();
}

class MainButtonState extends State<MainButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _isHovered
              ? CustomColor.yellowPrimary.withOpacity(0.8)
              : CustomColor.yellowPrimary,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                      color: Colors.amberAccent,
                      blurRadius: 15,
                      spreadRadius: 2)
                ]
              : [
                  BoxShadow(
                      color: CustomColor.yellowPrimary.withOpacity(0.5),
                      blurRadius: 10)
                ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: widget.onPressed ?? () {},
          child: Text(
            "Get in touch",
            style: TextStyle(
                color: CustomColor.whitePrimary,
                fontWeight: FontWeight.bold,
                fontSize: widget.fontSize),
          ),
        ),
      ),
    );
  }
}
