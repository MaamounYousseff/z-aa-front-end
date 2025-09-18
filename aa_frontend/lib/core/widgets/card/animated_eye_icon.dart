import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedEyeIcon extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color hoverBackgroundColor;
  final Color hoverBorderColor;
  final Color hoverIconColor;
  final bool isHovered;
  final AnimationController animationController;

  const AnimatedEyeIcon({
    super.key,
    required this.size,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.hoverBackgroundColor,
    required this.hoverBorderColor,
    required this.hoverIconColor,
    this.isHovered = false,
    required this.animationController,
  });

  @override
  State<AnimatedEyeIcon> createState() => _AnimatedEyeIconState();
}

class _AnimatedEyeIconState extends State<AnimatedEyeIcon>
    with TickerProviderStateMixin {
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _borderColorAnimation;
  late Animation<Color?> _iconColorAnimation;

  @override
  void initState() {
    super.initState();

    // Rotation: ~5 degrees (0.087 rad)
    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Scale animation (breathe effect)
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Color transitions
    _backgroundColorAnimation =
        ColorTween(
          begin: widget.backgroundColor,
          end: widget.hoverBackgroundColor,
        ).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.easeInOut,
          ),
        );

    _borderColorAnimation =
        ColorTween(
          begin: widget.borderColor,
          end: widget.hoverBorderColor,
        ).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.easeInOut,
          ),
        );

    _iconColorAnimation =
        ColorTween(begin: widget.iconColor, end: widget.hoverIconColor).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  void triggerRotationAnimation() {
    widget.animationController.reset();
    widget.animationController.forward().then((_) {
      widget.animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 🔑 Dynamic sizing based on `size`
    final borderWidth = widget.size * 0.08; // 8% of size
    final borderRadius = widget.size * 0.25; // 25% of size
    final iconSize = widget.size * 0.55; // 55% of size
    final hoverScale = widget.isHovered ? 1.1 : 1.0;
    final hoverDuration = Duration(milliseconds: (widget.size * 3).toInt());
    // e.g., size=100 → 300ms

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: _backgroundColorAnimation.value,
                border: Border.all(
                  color: _borderColorAnimation.value ?? widget.borderColor,
                  width: borderWidth,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: AnimatedScale(
                  scale: hoverScale,
                  duration: hoverDuration,
                  curve: Curves.easeInOut,
                  child: Text(
                    '👁️',
                    style: TextStyle(
                      fontSize: iconSize,
                      color: _iconColorAnimation.value,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
