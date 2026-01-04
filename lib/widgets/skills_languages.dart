import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';
import 'package:kareem_portfolio/widgets/scroll_reveal.dart';

class SkillsLanguages extends StatefulWidget {
  const SkillsLanguages({super.key, this.alignment = WrapAlignment.start});
  final WrapAlignment alignment;

  @override
  SkillsLanguagesState createState() => SkillsLanguagesState();
}

class SkillsLanguagesState extends State<SkillsLanguages> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: widget.alignment,
      spacing: 12,
      runSpacing: 12,
      children: List.generate(
        skillsItems.length,
        (index) => ScrollReveal(
          direction: RevealDirection.scale,
          delay: Duration(milliseconds: 80 * index),
          child: _buildSkillChip(index),
        ),
      ),
    );
  }

  Widget _buildSkillChip(int index) {
    final isHovered = _hoveredIndex == index;
    final item = skillsItems[index];

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: AnimatedContainer(
        duration: AppTheme.durationNormal,
        curve: AppTheme.curveDefault,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: AppTheme.radiusFull,
          gradient: isHovered
              ? LinearGradient(
                  colors: [
                    CustomColor.gradientStart.withOpacity(0.2),
                    CustomColor.gradientEnd.withOpacity(0.2),
                  ],
                )
              : LinearGradient(
                  colors: [
                    CustomColor.bgLight2,
                    CustomColor.bgLightk,
                  ],
                ),
          border: Border.all(
            color: isHovered
                ? CustomColor.gradientMid
                : CustomColor.glassBorder.withOpacity(0.3),
            width: isHovered ? 1.5 : 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.glowPurple.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: AppTheme.radiusFull,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: isHovered ? 3 : 0,
              sigmaY: isHovered ? 3 : 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: isHovered
                        ? CustomColor.primaryGradient
                        : null,
                    color: isHovered ? null : CustomColor.bgLight2,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: ClipOval(
                    child: Image.asset(
                      item["img"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Title
                Text(
                  item["title"],
                  style: AppTheme.labelLarge.copyWith(
                    color: isHovered
                        ? CustomColor.whitePrimary
                        : CustomColor.whiteSecondary,
                    fontWeight: isHovered ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
