import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';

class ParticleBackground extends StatefulWidget {
  final int particleCount;
  final double particleSize;
  final Color? particleColor;

  const ParticleBackground({
    super.key,
    this.particleCount = 50,
    this.particleSize = 3,
    this.particleColor,
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    particles = List.generate(
      widget.particleCount,
      (index) => Particle(
        color:
            widget.particleColor ?? CustomColor.accentPurple.withOpacity(0.3),
        size: widget.particleSize,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(
            particles: particles,
            animationValue: _controller.value,
          ),
          child: Container(),
        );
      },
    );
  }
}

class Particle {
  late double x;
  late double y;
  late double vx;
  late double vy;
  final Color color;
  final double size;
  late double opacity;

  Particle({
    required this.color,
    required this.size,
  }) {
    final random = Random();
    x = random.nextDouble();
    y = random.nextDouble();
    vx = (random.nextDouble() - 0.5) * 0.0005;
    vy = (random.nextDouble() - 0.5) * 0.0005;
    opacity = random.nextDouble() * 0.5 + 0.3;
  }

  void update() {
    x += vx;
    y += vy;

    // Wrap around edges
    if (x < 0) x = 1;
    if (x > 1) x = 0;
    if (y < 0) y = 1;
    if (y > 1) y = 0;
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlePainter({
    required this.particles,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.update();

      final paint = Paint()
        ..color = particle.color.withOpacity(particle.opacity)
        ..style = PaintingStyle.fill;

      final position = Offset(
        particle.x * size.width,
        particle.y * size.height,
      );

      canvas.drawCircle(position, particle.size, paint);

      // Draw glow
      final glowPaint = Paint()
        ..color = particle.color.withOpacity(particle.opacity * 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

      canvas.drawCircle(position, particle.size * 2, glowPaint);
    }

    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final p1 = particles[i];
        final p2 = particles[j];

        final dx = (p1.x - p2.x) * size.width;
        final dy = (p1.y - p2.y) * size.height;
        final distance = sqrt(dx * dx + dy * dy);

        if (distance < 150) {
          final opacity = (1 - distance / 150) * 0.2;
          final linePaint = Paint()
            ..color = CustomColor.accentPurple.withOpacity(opacity)
            ..strokeWidth = 1;

          canvas.drawLine(
            Offset(p1.x * size.width, p1.y * size.height),
            Offset(p2.x * size.width, p2.y * size.height),
            linePaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}
