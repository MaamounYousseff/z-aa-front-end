import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCircle extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double size;
  final AnimationController animationController;
  final Icon icon;

  const AnimatedCircle({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.animationController,
    required this.size,
    required this.icon,
  });

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late Animation<double> _scaleAnimation;
  late Animation<double> _checkOpacityAnimation;
  late Animation<double> _checkScaleAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.elasticOut,
      ),
    );

    _checkOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _checkScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
      ),
    );

    _borderColorAnimation =
        ColorTween(
          begin: widget.primaryColor,
          end: widget.secondaryColor,
        ).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.easeInOut,
          ),
        );

    _backgroundColorAnimation =
        ColorTween(begin: Colors.white, end: widget.secondaryColor).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic values based on size
    final borderWidth = widget.size * 0.08; // 8% of size
    final shadowBlur = widget.size * 0.15; // 15% of size
    final shadowOffset = widget.size * 0.05; // 5% of size
    final iconSize = widget.size * 0.5; // 50% of size

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        final Color? backgroundColor = _backgroundColorAnimation.value;
        final Color? borderColor = _borderColorAnimation.value;

        return Transform.scale(
          scale: _scaleAnimation.value,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: borderColor ?? widget.primaryColor,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(widget.size / 2),
              boxShadow: [
                BoxShadow(
                  color:
                      backgroundColor?.withOpacity(0.3) ??
                      widget.primaryColor.withOpacity(0.3),
                  blurRadius: shadowBlur,
                  offset: Offset(0, shadowOffset),
                ),
              ],
            ),
            child: Center(
              child: Transform.scale(
                scale: _checkScaleAnimation.value,
                child: Opacity(
                  opacity: _checkOpacityAnimation.value,
                  child: widget.icon,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
