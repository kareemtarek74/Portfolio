import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';

class AppGradients {
  static const LinearGradient hero = LinearGradient(
    colors: [
      CustomColor.gradientStart,
      CustomColor.gradientMid,
      CustomColor.gradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroReverse = LinearGradient(
    colors: [
      CustomColor.gradientEnd,
      CustomColor.gradientMid,
      CustomColor.gradientStart,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueToPurple = LinearGradient(
    colors: [CustomColor.accentBlue, CustomColor.accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleToPink = LinearGradient(
    colors: [CustomColor.accentPurple, CustomColor.accentPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cyanToBlue = LinearGradient(
    colors: [CustomColor.accentCyan, CustomColor.accentBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient gold = LinearGradient(
    colors: [CustomColor.yellowPrimary, CustomColor.yellowSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkBg = LinearGradient(
    colors: [
      CustomColor.scaffoldBg,
      CustomColor.bgLightk,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cardBg = LinearGradient(
    colors: [
      CustomColor.bgLight2,
      CustomColor.bgLightk,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient overlay = LinearGradient(
    colors: [
      Color(0x00000000),
      Color(0xCC000000),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient overlayReverse = LinearGradient(
    colors: [
      Color(0xCC000000),
      Color(0x00000000),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient shimmer = LinearGradient(
    colors: [
      Color(0x00FFFFFF),
      Color(0x33FFFFFF),
      Color(0x00FFFFFF),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );

  static const LinearGradient glass = LinearGradient(
    colors: [
      CustomColor.glassBg,
      CustomColor.glassHighlight,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassBorder = LinearGradient(
    colors: [
      CustomColor.glassBorder,
      Color(0x00FFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient spotlight = RadialGradient(
    colors: [
      CustomColor.glowPurple,
      Color(0x00000000),
    ],
    radius: 1.5,
  );

  static const RadialGradient glow = RadialGradient(
    colors: [
      CustomColor.gradientMid,
      Color(0x00000000),
    ],
    radius: 2.0,
  );

  static LinearGradient animated(double animationValue) {
    return LinearGradient(
      colors: const [
        CustomColor.gradientStart,
        CustomColor.gradientMid,
        CustomColor.gradientEnd,
      ],
      stops: [
        (animationValue - 0.3).clamp(0.0, 1.0),
        animationValue.clamp(0.0, 1.0),
        (animationValue + 0.3).clamp(0.0, 1.0),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
