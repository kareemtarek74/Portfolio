import 'package:flutter/material.dart';

class CustomColor {
  static const Color scaffoldBg = Color(0xff0a0e27);
  static const Color bgLightk = Color(0xff1a1f3a);
  static const Color bgLight2 = Color(0xff252b4a);

  static const Color whitePrimary = Color(0xffF8F9FA);
  static const Color whiteSecondary = Color(0xffC8C9CE);
  static const Color textFieldBg = Color(0xffC8C9CE);
  static const Color hintDark = Color(0xff666874);

  static const Color yellowPrimary = Color(0xffFFAF29);
  static const Color yellowSecondary = Color(0xffFFC25C);
  static const Color accentBlue = Color(0xff4A90E2);
  static const Color accentPurple = Color(0xff9D50BB);
  static const Color accentPink = Color(0xffE91E63);
  static const Color accentCyan = Color(0xff00D9FF);
  static const Color accentGreen = Color(0xff4CAF50);

  static const Color glassBg = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color glassHighlight = Color(0x0DFFFFFF);

  static const Color gradientStart = Color(0xff6366F1);
  static const Color gradientMid = Color(0xff8B5CF6);
  static const Color gradientEnd = Color(0xffEC4899);

  static const Color shadowDark = Color(0x40000000);
  static const Color glowPurple = Color(0x4D8B5CF6);
  static const Color glowBlue = Color(0x4D4A90E2);
  static const Color glowPink = Color(0x4DEC4899);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientMid, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentBlue, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [yellowPrimary, yellowSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [
      Color(0x00FFFFFF),
      Color(0x33FFFFFF),
      Color(0x00FFFFFF),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );
}
