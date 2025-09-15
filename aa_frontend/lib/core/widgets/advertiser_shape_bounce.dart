import 'package:aa_frontend/core/helpers/extensions.dart';
import 'package:aa_frontend/core/theming/Colors.dart';
import 'package:flutter/widgets.dart';

class AdvertiserShapeBounce extends StatefulWidget {
  final AnimationController animationController;
  final double size;
  const AdvertiserShapeBounce({
    super.key,
    required this.animationController,
    required this.size,
  });

  @override
  State<StatefulWidget> createState() => _AdvertiserShapeBounceState();
}

class _AdvertiserShapeBounceState extends State<AdvertiserShapeBounce> {
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _scaleAnimation = Tween<double>(begin: 1, end: 1.05).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );
    _rotationAnimation =
        Tween<double>(begin: 0, end: 0.05 * 3.14159) // ~9 degrees
            .animate(
              CurvedAnimation(
                parent: widget.animationController,
                curve: Curves.easeInOut,
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        final scale = _scaleAnimation.value;
        final rotation = _rotationAnimation.value;
        return child!.withRotate(rotation).withScale(scale);
      },

      child: SizedBox(
        width: 1.5 * widget.size,
        height: widget.size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.size / 2),
            color: ColorsManager.mainColorAdvertiser,
          ),
        ),
      ),
    );
  }
}
