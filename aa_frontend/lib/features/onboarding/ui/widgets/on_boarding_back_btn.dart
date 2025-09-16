import 'package:aa_frontend/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBackBtn extends StatefulWidget {
  final VoidCallback pressedAction;
  final bool isActive;

  const OnBoardingBackBtn({
    super.key,
    required this.pressedAction,
    required this.isActive,
  });

  @override
  State<StatefulWidget> createState() => _OnBoardingBackBtn();
}

class _OnBoardingBackBtn extends State<OnBoardingBackBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.isActive ? widget.pressedAction : null,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ), // remove default padding
        minimumSize: MaterialStateProperty.all(
          Size.zero,
        ), // remove minWidth/minHeight
        tapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // shrink tap area if needed
      ),
      child: Ink(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.chevron_left, color: Colors.black, size: 18.r),
              SizedBox(width: 8.w),
              Text("Back", style: TextStyles.font16Dark500Weight),
            ],
          ),
        ),
      ),
    );
  }
}
