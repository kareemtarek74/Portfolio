import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/constants/nav_items.dart';
import 'package:kareem_portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuClicked,
    this.activeSection = 0,
  });
  final Function(int) onNavMenuClicked;
  final int activeSection;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: AppTheme.radiusFull,
        boxShadow: AppTheme.shadowMd,
      ),
      child: ClipRRect(
        borderRadius: AppTheme.radiusFull,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.glassBg,
                  CustomColor.glassHighlight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppTheme.radiusFull,
              border: Border.all(
                color: CustomColor.glassBorder,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                SiteLogo(
                  onTap: () => widget.onNavMenuClicked(0),
                ),
                const Spacer(),
                for (int i = 0; i < navTitles.length; i++)
                  _buildNavItem(i, navTitles[i]),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String title) {
    final isActive = widget.activeSection == index;
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: GestureDetector(
        onTap: () => widget.onNavMenuClicked(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: AppTheme.durationNormal,
                style: AppTheme.titleSmall.copyWith(
                  color: isActive || isHovered
                      ? CustomColor.whitePrimary
                      : CustomColor.whiteSecondary,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                ),
                child: Text(title),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: AppTheme.durationNormal,
                curve: AppTheme.curveDefault,
                height: 2,
                width: isActive
                    ? 40
                    : isHovered
                        ? 20
                        : 0,
                decoration: BoxDecoration(
                  gradient: CustomColor.primaryGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
