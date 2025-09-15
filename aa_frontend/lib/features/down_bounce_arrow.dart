import 'package:aa_frontend/core/helpers/extensions.dart';
import 'package:aa_frontend/extra/annotations/annotation_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DownBouncingFlesh extends StatefulWidget {
  final AnimationController animationController;
  final double size;

  const DownBouncingFlesh({
    super.key,
    required this.animationController,
    required this.size,
  });

  @override
  State<DownBouncingFlesh> createState() => _DownBouncingFleshState();
}

class _DownBouncingFleshState extends State<DownBouncingFlesh> {
  late Animation<double> _bounceAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _bounceAnimation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeInOut,
      ),
    );

    widget.animationController.repeat(reverse: true);
  }

  @override
  @NotUnderstand("leh  declaration  of final lezem ykono  jowet builder")
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        final opacity = _opacityAnimation.value;
        final bounce = _bounceAnimation.value;
        final offset = Offset(0, bounce);

        return child!.withTranslate(offset).withOpacity(opacity);
      },
      child: SvgPicture.asset(
        "assets/svgs/arrow_down.svg",
        width: widget.size,
        height: widget.size,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
    );
  }
}
