import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/utils/project_utils.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 295,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: CustomColor.bgLight2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image,
            fit: BoxFit.fill,
            height: 160,
            width: 260,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Text(
              project.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                  color: CustomColor.whitePrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
            child: Text(
              project.subTitle,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color: CustomColor.whiteSecondary),
            ),
          ),
          Spacer(),
          Container(
            color: CustomColor.bgLightk,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                Text(
                  "Available on:",
                  style: TextStyle(
                      color: CustomColor.yellowSecondary, fontSize: 10),
                ),
                Spacer(),
                if (project.androidLink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod(
                        "open",
                        [project.androidLink],
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/images/uil_android.svg",
                      width: 17,
                    ),
                  ),
                if (project.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod(
                          "open",
                          [project.iosLink],
                        );
                      },
                      child: SvgPicture.asset(
                        "assets/images/ic_baseline-apple.svg",
                        width: 20,
                      ),
                    ),
                  ),
                if (project.githubLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod(
                          "open",
                          [project.githubLink],
                        );
                      },
                      child: SvgPicture.asset(
                        "assets/images/github.svg",
                        width: 18,
                      ),
                    ),
                  ),
                if (project.linkedInLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod(
                          "open",
                          [project.linkedInLink],
                        );
                      },
                      child: SvgPicture.asset(
                        "assets/images/linkedin.svg",
                        width: 18,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
