import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/constants/skills_items.dart';
import 'package:kareem_portfolio/widgets/scroll_reveal.dart';
import 'package:kareem_portfolio/widgets/skills_languages.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          ...List.generate(
            platformItems.length,
            (index) => ScrollReveal(
              direction: RevealDirection.fromLeft,
              delay: Duration(milliseconds: 100 * index),
              child: _buildPlatformCard(platformItems[index]),
            ),
          ),
          const SizedBox(height: 40),
          const ScrollReveal(
            direction: RevealDirection.fromBottom,
            child: SkillsLanguages(alignment: WrapAlignment.center),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformCard(Map<dynamic, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 90,
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
          color: CustomColor.glassBorder.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: AppTheme.shadowMd,
      ),
      child: ClipRRect(
        borderRadius: AppTheme.radiusLg,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: CustomColor.accentGradient,
                    borderRadius: AppTheme.radiusMd,
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
    );
  }
}
