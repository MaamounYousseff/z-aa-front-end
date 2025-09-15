import 'package:aa_frontend/core/helpers/extensions.dart';
import 'package:aa_frontend/core/theming/Colors.dart';
import 'package:flutter/widgets.dart';

class CompanyShapeBounce extends StatefulWidget {
  final AnimationController animationController;
  final double size;
  const CompanyShapeBounce({
    super.key,
    required this.animationController,
    required this.size,
  });

  @override
  State<StatefulWidget> createState() => CompanyShapeBounceState();
}

class CompanyShapeBounceState extends State<CompanyShapeBounce> {
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceAnimation = Tween<double>(begin: 0, end: -0.2).animate(
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
        final bounce = _bounceAnimation.value;
        final offset = Offset(0, -30 * bounce);

        return child!.withTranslate(offset);
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.mainColorCompany,
          ),
        ),
      ),
    );
  }
}
