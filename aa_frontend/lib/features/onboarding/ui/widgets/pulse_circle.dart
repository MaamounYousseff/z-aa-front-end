import 'package:aa_frontend/core/helpers/extensions.dart';
import 'package:aa_frontend/extra/annotations/annotation_info.dart';
import 'package:flutter/material.dart';

class PulseCircle extends StatefulWidget {
  final double size;
  final bool isOn;
  const PulseCircle({super.key, required this.size, required this.isOn});

  @override
  State<StatefulWidget> createState() => _PulseCircleState();
}

@NotUnderstand("what is the late here.")
@Answer(
  "late is used to declare a non-nullable variable that will be initialized later in the run time.",
)
class _PulseCircleState extends State<PulseCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // start animation only if isOn = true
    if (widget.isOn) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCircleOff({required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }

  Widget _buildCircleOn({required double size, required double opacity}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.blue],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    ).withOpacity(opacity);
  }

  @override
  @NotUnderstand("Stack and Transform")
  @Answer(
    "Why we use Stack? To create multiple circle over each other. so we can get the pulse effect. (as we can see also  we change the circle opacity at each Transform.scale call)",
  )
  @Answer("Transform.scale → makes the widget grow/shrink from its center.")
  Widget build(BuildContext context) {
    if (widget.isOn == false) {
      return _buildCircleOff(size: widget.size);
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final scale = _scaleAnimation.value;
        final opacity = _opacityAnimation.value;
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: scale,
              child: _buildCircleOn(size: widget.size, opacity: opacity),
            ),
            _buildCircleOn(
              size: widget.size,
              opacity: 1.0,
            ), //this is the main circle.
          ],
        );
      },
    );
  }
}
