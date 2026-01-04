import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
  });
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppTheme.durationNormal,
      decoration: BoxDecoration(
        borderRadius: AppTheme.radiusMd,
        border: Border.all(
          color: _isFocused
              ? CustomColor.gradientMid
              : CustomColor.glassBorder,
          width: _isFocused ? 2 : 1,
        ),
        gradient: LinearGradient(
          colors: [
            CustomColor.bgLight2.withOpacity(0.5),
            CustomColor.bgLightk.withOpacity(0.5),
          ],
        ),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: CustomColor.glowPurple.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() => _isFocused = hasFocus);
        },
        child: TextField(
          controller: widget.controller,
          maxLines: widget.maxLines,
          style: AppTheme.bodyMedium.copyWith(
            color: CustomColor.whitePrimary,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: widget.hintText,
            hintStyle: AppTheme.bodyMedium.copyWith(
              color: CustomColor.hintDark,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
