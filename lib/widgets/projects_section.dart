import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/utils/project_utils.dart';
import 'package:kareem_portfolio/widgets/project_card.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('projects-section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
          _controller.forward();
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          width: widget.screenWidth,
          padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
          child: Column(
            children: [
              Text(
                'Some of my projects',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary),
              ),
              SizedBox(
                height: 50,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 950),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  children: [
                    for (var i = 0; i < projectList.length; i++)
                      ProjectCard(
                        project: projectList[i],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
