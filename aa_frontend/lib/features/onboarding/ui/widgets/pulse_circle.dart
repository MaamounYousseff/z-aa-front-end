import 'package:aa_frontend/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class PulseCircle extends StatefulWidget {
  final double size;
  final bool isOn;
  final AnimationController controller;

  // ignore: prefer_const_constructors_in_immutables
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
    init(); // call custom init method
  }

  void init() {
    // Initialize the animations only once per circle
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.6).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
    );
  }

  Widget circleOff() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }

  Widget circleOn() {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final scale = _scaleAnimation.value;
        final opacity = _opacityAnimation.value;

        return Stack(
          alignment: Alignment.center,
          children: [
            filledCircleWidget().withScale(scale).withOpacity(opacity),
            filledCircleWidget(),
          ],
        );
      },
    );
  }

  Widget filledCircleWidget() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF26A69A), Color(0xFF38BDF8)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isOn) {
      return circleOff();
    }

    return circleOn();
  }
}
