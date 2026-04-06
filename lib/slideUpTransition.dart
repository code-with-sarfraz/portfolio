import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollSlideUp extends StatefulWidget {
  final Widget child;
  final double offset;
  final Duration duration;

  const ScrollSlideUp({
    super.key,
    required this.child,
    this.offset = 40,
    this.duration = const Duration(milliseconds: 600),
  });
  @override
  State<ScrollSlideUp> createState() => _ScrollSlideUpState();
}

class _ScrollSlideUpState extends State<ScrollSlideUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _visibleOnce = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_visibleOnce) {
          _visibleOnce = true;
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        child: widget.child,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, (1 - _animation.value) * widget.offset),
            child: Opacity(opacity: _animation.value, child: child),
          );
        },
      ),
    );
  }
}