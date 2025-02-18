import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/utils/project_utils.dart';
import 'package:kareem_portfolio/widgets/project_card.dart';
import 'package:sizer/sizer.dart';

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
    );
  }
}
