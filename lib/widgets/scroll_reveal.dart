import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum RevealDirection {
  fromBottom,
  fromTop,
  fromLeft,
  fromRight,
  scale,
  fade,
}

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final RevealDirection direction;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final double offset;

  const ScrollReveal({
    super.key,
    required this.child,
    this.direction = RevealDirection.fromBottom,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.offset = 50,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    if (!_hasAnimated) {
      setState(() => _hasAnimated = true);
      if (widget.delay > Duration.zero) {
        await Future.delayed(widget.delay);
      }
      if (mounted) {
        _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('scroll-reveal-${widget.child.hashCode}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          _startAnimation();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return _buildAnimatedWidget();
        },
        child: widget.child,
      ),
    );
  }

  Widget _buildAnimatedWidget() {
    switch (widget.direction) {
      case RevealDirection.fromBottom:
        return Transform.translate(
          offset: Offset(0, widget.offset * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: widget.child,
          ),
        );
      case RevealDirection.fromTop:
        return Transform.translate(
          offset: Offset(0, -widget.offset * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: widget.child,
          ),
        );
      case RevealDirection.fromLeft:
        return Transform.translate(
          offset: Offset(-widget.offset * (1 - _animation.value), 0),
          child: Opacity(
            opacity: _animation.value,
            child: widget.child,
          ),
        );
      case RevealDirection.fromRight:
        return Transform.translate(
          offset: Offset(widget.offset * (1 - _animation.value), 0),
          child: Opacity(
            opacity: _animation.value,
            child: widget.child,
          ),
        );
      case RevealDirection.scale:
        return Transform.scale(
          scale: 0.8 + (0.2 * _animation.value),
          child: Opacity(
            opacity: _animation.value,
            child: widget.child,
          ),
        );
      case RevealDirection.fade:
        return Opacity(
          opacity: _animation.value,
          child: widget.child,
        );
    }
  }
}

class StaggeredScrollReveal extends StatelessWidget {
  final List<Widget> children;
  final RevealDirection direction;
  final Duration staggerDelay;
  final Duration itemDuration;
  final Axis axis;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const StaggeredScrollReveal({
    super.key,
    required this.children,
    this.direction = RevealDirection.fromBottom,
    this.staggerDelay = const Duration(milliseconds: 100),
    this.itemDuration = const Duration(milliseconds: 600),
    this.axis = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: List.generate(
        children.length,
        (index) => ScrollReveal(
          direction: direction,
          duration: itemDuration,
          delay: staggerDelay * index,
          child: children[index],
        ),
      ),
    );
  }
}
