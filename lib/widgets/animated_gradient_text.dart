import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';

class AnimatedGradientText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  final bool animate;
  final Duration? duration;

  const AnimatedGradientText({
    super.key,
    required this.text,
    this.style,
    this.gradient,
    this.animate = true,
    this.duration,
  });

  @override
  State<AnimatedGradientText> createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(seconds: 3),
      );
      _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    if (widget.animate) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = widget.gradient ?? CustomColor.primaryGradient;
    final textStyle = widget.style ?? AppTheme.displayLarge;

    if (!widget.animate) {
      return ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(
          widget.text,
          style: textStyle.copyWith(color: Colors.white),
        ),
      );
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final animatedGradient = LinearGradient(
              colors: const [
                CustomColor.gradientStart,
                CustomColor.gradientMid,
                CustomColor.gradientEnd,
                CustomColor.gradientStart,
              ],
              stops: [
                (_animation.value - 0.3).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 0.3).clamp(0.0, 1.0),
                (_animation.value + 0.6).clamp(0.0, 1.0),
              ],
            );
            return animatedGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            );
          },
          child: Text(
            widget.text,
            style: textStyle.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
