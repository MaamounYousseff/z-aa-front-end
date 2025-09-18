import 'package:aa_frontend/core/theming/styles.dart';
import 'package:aa_frontend/core/widgets/card/animated_eye_icon.dart';
import 'package:aa_frontend/core/widgets/card/circle_selected_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCardContainer extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final String title;
  final AnimationController animationController; // <- input controller
  final AnimatedEyeIcon animatedEyeIcon;
  final AnimatedCircle animatedCircle;

  const AnimatedCardContainer({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.title,
    required this.animationController,
    required this.animatedEyeIcon,
    required this.animatedCircle,
  });

  @override
  State<StatefulWidget> createState() => _AnimatedCardContainer();
}

class _AnimatedCardContainer extends State<AnimatedCardContainer> {
  AnimationController get controller => widget.animationController;
  Color get primaryColor => widget.primaryColor;
  String get title => widget.title;

  late Animation<Color?> _animationColor;

  @override
  void initState() {
    super.initState();
    _animationColor =
        ColorTween(
          begin: widget.primaryColor,
          end: widget.secondaryColor,
        ).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top animated border
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                final Color? _color = _animationColor.value;

                return Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor:
                        0.1 +
                        0.9 * controller.value, // start small, animate to full
                    child: Container(
                      height: 4.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [?_color, ?_color?.withOpacity(0.8)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Card content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with icon and role name
                  Row(
                    children: [
                      widget.animatedEyeIcon,

                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyles.font20w800Gray700Weight,
                        ),
                      ),
                      widget.animatedCircle,
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Permissions list can go here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
