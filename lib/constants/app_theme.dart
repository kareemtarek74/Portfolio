import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';

class AppTheme {
  static TextStyle get displayLarge => GoogleFonts.poppins(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: CustomColor.whitePrimary,
        height: 1.2,
      );

  static TextStyle get displayMedium => GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: CustomColor.whitePrimary,
        height: 1.2,
      );

  static TextStyle get displaySmall => GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: CustomColor.whitePrimary,
        height: 1.3,
      );

  static TextStyle get headlineLarge => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: CustomColor.whitePrimary,
        height: 1.3,
      );

  static TextStyle get headlineMedium => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: CustomColor.whitePrimary,
        height: 1.4,
      );

  static TextStyle get headlineSmall => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: CustomColor.whitePrimary,
        height: 1.4,
      );

  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: CustomColor.whitePrimary,
        height: 1.4,
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: CustomColor.whitePrimary,
        height: 1.5,
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: CustomColor.whitePrimary,
        height: 1.5,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: CustomColor.whiteSecondary,
        height: 1.6,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: CustomColor.whiteSecondary,
        height: 1.6,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CustomColor.whiteSecondary,
        height: 1.6,
      );

  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: CustomColor.whitePrimary,
        letterSpacing: 0.5,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: CustomColor.whitePrimary,
        letterSpacing: 0.5,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: CustomColor.whitePrimary,
        letterSpacing: 0.5,
      );

  static List<BoxShadow> get shadowSm => [
        BoxShadow(
          color: CustomColor.shadowDark,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get shadowMd => [
        BoxShadow(
          color: CustomColor.shadowDark,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get shadowLg => [
        BoxShadow(
          color: CustomColor.shadowDark,
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> get shadowXl => [
        BoxShadow(
          color: CustomColor.shadowDark,
          blurRadius: 24,
          offset: const Offset(0, 12),
        ),
      ];

  static List<BoxShadow> get glowPurple => [
        BoxShadow(
          color: CustomColor.glowPurple,
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ];

  static List<BoxShadow> get glowBlue => [
        BoxShadow(
          color: CustomColor.glowBlue,
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ];

  static List<BoxShadow> get glowPink => [
        BoxShadow(
          color: CustomColor.glowPink,
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ];

  static const Duration durationFast = Duration(milliseconds: 200);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
  static const Duration durationVerySlow = Duration(milliseconds: 800);

  static const Curve curveDefault = Curves.easeInOut;
  static const Curve curveSmooth = Curves.easeOutCubic;
  static const Curve curveBounce = Curves.easeOutBack;
  static const Curve curveElastic = Curves.elasticOut;

  static BorderRadius get radiusSm => BorderRadius.circular(8);
  static BorderRadius get radiusMd => BorderRadius.circular(12);
  static BorderRadius get radiusLg => BorderRadius.circular(16);
  static BorderRadius get radiusXl => BorderRadius.circular(24);
  static BorderRadius get radiusFull => BorderRadius.circular(9999);

  static const double spacingXs = 4;
  static const double spacingSm = 8;
  static const double spacingMd = 16;
  static const double spacingLg = 24;
  static const double spacingXl = 32;
  static const double spacing2Xl = 48;
  static const double spacing3Xl = 64;
}
