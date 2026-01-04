import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    required this.onLogoTap,
    required this.onMenuTap,
  });
  final void Function() onLogoTap;
  final void Function() onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                const SizedBox(width: 15),
                SiteLogo(onTap: onLogoTap),
                const Spacer(),
                IconButton(
                  onPressed: onMenuTap,
                  icon: ShaderMask(
                    shaderCallback: (bounds) =>
                        CustomColor.primaryGradient.createShader(bounds),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
