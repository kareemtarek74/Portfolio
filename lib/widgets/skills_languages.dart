import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsLanguages extends StatefulWidget {
  const SkillsLanguages({super.key, this.alignment = WrapAlignment.start});
  final WrapAlignment alignment;

  @override
  SkillsLanguagesState createState() => SkillsLanguagesState();
}

class SkillsLanguagesState extends State<SkillsLanguages>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _startAnimation() {
    if (!_isAnimated) {
      setState(() {
        _isAnimated = true;
      });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("skills-languages"),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _startAnimation();
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Wrap(
          alignment: widget.alignment,
          spacing: 10,
          runSpacing: 10,
          children: [
            for (int i = 0; i < skillsItems.length; i++)
              Chip(
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                backgroundColor: CustomColor.bgLight2,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                label: Text(skillsItems[i]["title"]),
                avatar: Image.asset(
                  skillsItems[i]["img"],
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
