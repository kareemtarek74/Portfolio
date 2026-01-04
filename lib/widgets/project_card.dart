import 'dart:js' as js;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/utils/project_utils.dart';
import 'package:kareem_portfolio/widgets/project_detail_modal.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  State<ProjectCard> createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppTheme.durationNormal,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _elevationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) {
          setState(() => _isHovered = true);
          _controller.forward();
        },
        onExit: (_) {
          setState(() => _isHovered = false);
          _controller.reverse();
        },
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierColor: Colors.transparent,
              builder: (context) => ProjectDetailModal(project: widget.project),
            );
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 320,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: AppTheme.radiusLg,
                    gradient: LinearGradient(
                      colors: [
                        CustomColor.bgLight2,
                        CustomColor.bgLightk,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.shadowDark,
                        blurRadius: 8 + (12 * _elevationAnimation.value),
                        offset: Offset(0, 4 + (8 * _elevationAnimation.value)),
                      ),
                      if (_isHovered)
                        BoxShadow(
                          color: CustomColor.glowPurple
                              .withOpacity(0.3 * _elevationAnimation.value),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                    ],
                    border: Border.all(
                      color: _isHovered
                          ? CustomColor.glassBorder
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image with overlay
                      Stack(
                        children: [
                          AnimatedContainer(
                            duration: AppTheme.durationNormal,
                            height: 170,
                            width: 280,
                            child: Image.asset(
                              widget.project.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Gradient Overlay
                          AnimatedContainer(
                            duration: AppTheme.durationNormal,
                            height: 170,
                            width: 280,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  CustomColor.scaffoldBg.withOpacity(
                                    _isHovered ? 0.3 : 0.6,
                                  ),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          if (_isHovered)
                            Positioned.fill(
                              child: Container(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: CustomColor.primaryGradient,
                                    boxShadow: [
                                      BoxShadow(
                                        color: CustomColor.glowPurple,
                                        blurRadius: 20,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.project.title,
                                style: AppTheme.titleMedium.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Expanded(
                                child: Text(
                                  widget.project.subTitle,
                                  style: AppTheme.bodySmall,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  CustomColor.glassBg,
                                  CustomColor.glassHighlight,
                                ],
                              ),
                              border: Border(
                                top: BorderSide(
                                  color:
                                      CustomColor.glassBorder.withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Available on:",
                                  style: AppTheme.labelSmall.copyWith(
                                    color: CustomColor.yellowSecondary,
                                  ),
                                ),
                                const Spacer(),
                                if (widget.project.androidLink != null)
                                  _buildPlatformIcon(
                                    "assets/images/uil_android.svg",
                                    widget.project.androidLink!,
                                    17,
                                  ),
                                if (widget.project.iosLink != null)
                                  _buildPlatformIcon(
                                    "assets/images/ic_baseline-apple.svg",
                                    widget.project.iosLink!,
                                    20,
                                  ),
                                if (widget.project.githubLink != null)
                                  _buildPlatformIcon(
                                    "assets/images/github.svg",
                                    widget.project.githubLink!,
                                    18,
                                  ),
                                if (widget.project.linkedInLink != null)
                                  _buildPlatformIcon(
                                    "assets/images/linkedin.svg",
                                    widget.project.linkedInLink!,
                                    18,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  Widget _buildPlatformIcon(String assetPath, String link, double size) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () => js.context.callMethod("open", [link]),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: CustomColor.glassBg,
            ),
            child: SvgPicture.asset(
              assetPath,
              width: size,
              height: size,
            ),
          ),
        ),
      ),
    );
  }
}
