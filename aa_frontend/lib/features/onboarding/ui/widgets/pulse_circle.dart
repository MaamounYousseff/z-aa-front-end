import 'package:aa_frontend/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class PulseCircle extends StatefulWidget {
  final double size;
  final bool isOn;
  final AnimationController controller;

  const PulseCircle({
    super.key,
    required this.size,
    required this.isOn,
    required this.controller,
  });

  @override
  State<PulseCircle> createState() => _PulseCircleState();
}

class _PulseCircleState extends State<PulseCircle> {
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.6).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
    );
  }

  Widget _buildCircleOff() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildCircleOn({required double scale, required double opacity}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: scale,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ).withOpacity(opacity),
        ),
        Container(
          width: widget.size,
          height: widget.size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isOn) {
      return _buildCircleOff();
    }

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return _buildCircleOn(
          scale: _scaleAnimation.value,
          opacity: _opacityAnimation.value,
        );
      },
    );
  }
}
