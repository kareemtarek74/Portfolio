import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/utils/project_utils.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  State<ProjectCard> createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: _isHovered
            ? Matrix4.diagonal3Values(1.05, 1.05, 1)
            : Matrix4.identity(),
        clipBehavior: Clip.antiAlias,
        height: 295,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.bgLight2,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _isHovered
                ? Hero(
                    tag: 'project-${widget.project.title}',
                    child: Image.asset(
                      widget.project.image,
                      fit: BoxFit.fill,
                      height: 160,
                      width: 260,
                    ),
                  )
                : Image.asset(
                    widget.project.image,
                    fit: BoxFit.fill,
                    height: 160,
                    width: 260,
                  ),
            // Rest of the card content...
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
              child: Text(
                widget.project.title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                    color: CustomColor.whitePrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
              child: Text(
                widget.project.subTitle,
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
                  if (widget.project.androidLink != null)
                    InkWell(
                      onTap: () {
                        js.context.callMethod(
                          "open",
                          [widget.project.androidLink],
                        );
                      },
                      child: SvgPicture.asset(
                        "assets/images/uil_android.svg",
                        width: 17,
                      ),
                    ),
                  if (widget.project.iosLink != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          js.context.callMethod(
                            "open",
                            [widget.project.iosLink],
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/images/ic_baseline-apple.svg",
                          width: 20,
                        ),
                      ),
                    ),
                  if (widget.project.githubLink != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          js.context.callMethod(
                            "open",
                            [widget.project.githubLink],
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/images/github.svg",
                          width: 18,
                        ),
                      ),
                    ),
                  if (widget.project.linkedInLink != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          js.context.callMethod(
                            "open",
                            [widget.project.linkedInLink],
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
      ),
    );
  }
}
