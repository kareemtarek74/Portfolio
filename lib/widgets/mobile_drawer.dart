import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/constants/nav_items.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({
    super.key,
    required this.onNavItemClicked,
  });
  final Function(int) onNavItemClicked;

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColor.bgLightk.withOpacity(0.95),
              CustomColor.scaffoldBg.withOpacity(0.95),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: const Border(
            left: BorderSide(
              color: CustomColor.glassBorder,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) =>
                      CustomColor.primaryGradient.createShader(bounds),
                  child: Text(
                    'Menu',
                    style: AppTheme.headlineSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ...List.generate(
                  navTitles.length,
                  (index) => _buildNavItem(index, navTitles[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String title) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _controller,
        curve: Interval(
          (index * 0.1).clamp(0.0, 1.0),
          ((index + 1) * 0.1 + 0.5).clamp(0.0, 1.0),
          curve: Curves.easeOut,
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.3, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              (index * 0.1).clamp(0.0, 1.0),
              ((index + 1) * 0.1 + 0.5).clamp(0.0, 1.0),
              curve: Curves.easeOut,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => widget.onNavItemClicked(index),
              borderRadius: AppTheme.radiusMd,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: AppTheme.radiusMd,
                  gradient: const LinearGradient(
                    colors: [
                      CustomColor.glassBg,
                      Colors.transparent,
                    ],
                  ),
                  border: Border.all(
                    color: CustomColor.glassBorder.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(
                        gradient: CustomColor.primaryGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: AppTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
