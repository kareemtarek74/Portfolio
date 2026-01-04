import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';
import 'package:kareem_portfolio/widgets/scroll_reveal.dart';
import 'package:kareem_portfolio/widgets/skills_languages.dart';

class SkillsDeskTop extends StatefulWidget {
  const SkillsDeskTop({super.key});

  @override
  SkillsDeskTopState createState() => SkillsDeskTopState();
}

class SkillsDeskTopState extends State<SkillsDeskTop> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Platform Cards
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              platformItems.length,
              (index) => ScrollReveal(
                direction: RevealDirection.scale,
                delay: Duration(milliseconds: 100 * index),
                child: _buildPlatformCard(index),
              ),
            ),
          ),
        ),
        const SizedBox(width: 60),
        // Skills Languages
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: const SkillsLanguages(),
          ),
        ),
      ],
    );
  }

  Widget _buildPlatformCard(int index) {
    final isHovered = _hoveredIndex == index;
    final item = platformItems[index];

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: AnimatedContainer(
        duration: AppTheme.durationNormal,
        curve: AppTheme.curveDefault,
        width: 220,
        height: 100,
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
          border: Border.all(
            color: isHovered ? CustomColor.glassBorder : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: isHovered
              ? [
                  ...AppTheme.shadowLg,
                  BoxShadow(
                    color: CustomColor.glowBlue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : AppTheme.shadowMd,
        ),
        child: ClipRRect(
          borderRadius: AppTheme.radiusLg,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: isHovered ? 5 : 0,
              sigmaY: isHovered ? 5 : 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: isHovered
                    ? LinearGradient(
                        colors: [
                          CustomColor.glassBg,
                          Colors.transparent,
                        ],
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: CustomColor.accentGradient,
                      borderRadius: AppTheme.radiusMd,
                      boxShadow: isHovered
                          ? [
                              BoxShadow(
                                color: CustomColor.accentBlue.withOpacity(0.4),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      item["img"],
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Title
                  Expanded(
                    child: Text(
                      item["title"],
                      style: AppTheme.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
