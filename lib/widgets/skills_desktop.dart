import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';
import 'package:kareem_portfolio/widgets/skills_languages.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsDeskTop extends StatefulWidget {
  const SkillsDeskTop({super.key});

  @override
  SkillsDeskTopState createState() => SkillsDeskTopState();
}

class SkillsDeskTopState extends State<SkillsDeskTop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
      key: Key("skills-section-desktop"),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _startAnimation();
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < platformItems.length; i++)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        width: 200,
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          leading: SvgPicture.asset(
                            platformItems[i]["img"],
                            width: 26,
                          ),
                          title: Text(platformItems[i]["title"]),
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(width: 50),
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 430),
                  child: SkillsLanguages(),
                ),
              ),
            ],
          ),
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
