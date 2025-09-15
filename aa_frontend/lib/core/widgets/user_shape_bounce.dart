import 'package:aa_frontend/core/theming/Colors.dart';
import 'package:flutter/widgets.dart';

import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:aa_frontend/core/helpers/extensions.dart';
import 'package:aa_frontend/core/theming/Colors.dart';

class UserShapeBounce extends StatefulWidget {
  final AnimationController animationController;
  final double size;

  const UserShapeBounce({
    super.key,
    required this.animationController,
    required this.size,
  });

  @override
  State<StatefulWidget> createState() => UserShapeBounceState();
}

class UserShapeBounceState extends State<UserShapeBounce> {
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceAnimation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );

    widget.animationController.repeat(
      reverse: true,
      period: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        final distance = _bounceAnimation.value;
        final angle = 60 * pi / 180; // 20 degrees
        final dx = distance * cos(angle);
        final dy = -distance * sin(angle);

        return child!.withTranslate(Offset(dx, dy));
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.mainColorUser,
          ),
        ),
      ),
    );
  }
}
