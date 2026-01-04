import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/utils/project_utils.dart';
import 'package:kareem_portfolio/widgets/project_card.dart';
import 'package:kareem_portfolio/widgets/scroll_reveal.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.screenWidth,
  });
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          ScrollReveal(
            direction: RevealDirection.fromBottom,
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  CustomColor.primaryGradient.createShader(bounds),
              child: Text(
                "Projects",
                style: AppTheme.headlineLarge.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: List.generate(
                projectList.length,
                (index) => ScrollReveal(
                  direction: RevealDirection.scale,
                  delay: Duration(milliseconds: 100 * index),
                  child: ProjectCard(project: projectList[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
