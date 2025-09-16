import 'package:aa_frontend/features/onboarding/ui/widgets/continue_and_get_started_button.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_back_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBottomNavBar extends BottomAppBar {
  final int pageIndex;
  static const int total = 3;
  final VoidCallback backAction;
  final VoidCallback nextAction;
  final VoidCallback getStartedAction;
  const OnBoardingBottomNavBar({
    super.key,
    required this.pageIndex,
    required this.backAction,
    required this.nextAction,
    required this.getStartedAction,
  });

  @override
  State<StatefulWidget> createState() => _OnBoardingBottomNavBarState();
}

class _OnBoardingBottomNavBarState extends State<OnBoardingBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Middle text, always centered
          Text(""),

          // Left button
          Positioned(
            left: 0,
            child: widget.pageIndex > 0
                ? OnBoardingBackBtn(
                    pressedAction: widget.backAction,
                    isActive: true,
                  )
                : OnBoardingBackBtn(
                    pressedAction: widget.backAction,
                    isActive: false,
                  ),
          ),

          // Right button
          Positioned(
            right: 0,
            child: widget.pageIndex < 2
                ? OnBoardingButton(
                    pressedAction: widget.nextAction,
                    text: "Continue",
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 18.r,
                    ),
                  )
                : OnBoardingButton(
                    pressedAction: widget.nextAction,
                    text: "Get Started",
                    icon: Icon(Icons.start, color: Colors.white, size: 18.r),
                    isIconLeft: true,
                  ),
          ),
        ],
      ),
    );
  }
}
