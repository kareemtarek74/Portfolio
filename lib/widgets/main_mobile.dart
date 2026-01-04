import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/widgets/animated_button.dart';
import 'package:kareem_portfolio/widgets/animated_gradient_text.dart';
import 'package:kareem_portfolio/widgets/particle_background.dart';

class MainMobile extends StatefulWidget {
  final Size screenSize;
  final double screenWidth;

  const MainMobile({
    super.key,
    required this.screenSize,
    required this.screenWidth,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  MainMobileState createState() => MainMobileState();
}

class MainMobileState extends State<MainMobile> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _floatingController;
  late AnimationController _glowController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _floatingAnimation = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _glowAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _controller.forward().then((_) {
      _floatingController.repeat(reverse: true);
      _glowController.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: widget.screenSize.height,
      constraints: const BoxConstraints(minHeight: 560),
      child: Stack(
        children: [
          const Positioned.fill(
            child: ParticleBackground(
              particleCount: 25,
              particleSize: 2,
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AnimatedBuilder(
                    animation: Listenable.merge([
                      _floatingController,
                      _scaleAnimation,
                      _glowAnimation,
                    ]),
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _floatingAnimation.value),
                        child: Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: widget.screenWidth * 0.7,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColor.glowPurple
                                      .withOpacity(_glowAnimation.value * 0.5),
                                  blurRadius: 40 * _glowAnimation.value,
                                  spreadRadius: 8 * _glowAnimation.value,
                                ),
                                BoxShadow(
                                  color: CustomColor.glowPink
                                      .withOpacity(_glowAnimation.value * 0.3),
                                  blurRadius: 60 * _glowAnimation.value,
                                  spreadRadius: 12 * _glowAnimation.value,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "assets/images/my_flutter_avatar 1.png",
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Hi",
                  style: AppTheme.headlineMedium.copyWith(
                    color: CustomColor.whiteSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                AnimatedGradientText(
                  text: "I'm Kareem Tarek",
                  style: AppTheme.displaySmall,
                  gradient: CustomColor.primaryGradient,
                ),
                const SizedBox(height: 12),
                ShaderMask(
                  shaderCallback: (bounds) =>
                      CustomColor.goldGradient.createShader(bounds),
                  child: Text(
                    "A Flutter Developer",
                    style: AppTheme.headlineSmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: AnimatedButton(
                      onPressed: widget.onPressed,
                      text: "Get In Touch",
                      icon: Icons.mail_outline,
                      gradient: CustomColor.primaryGradient,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _floatingController.dispose();
    _glowController.dispose();
    super.dispose();
  }
}
