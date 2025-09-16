import 'package:aa_frontend/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingButton extends StatefulWidget {
  final VoidCallback pressedAction;
  final Icon? icon;
  final bool isIconLeft;
  final String text;
  const OnBoardingButton({
    super.key,
    required this.pressedAction,
    this.icon,
    this.isIconLeft = false,
    required this.text,
  });

  @override
  State<StatefulWidget> createState() => _OnBoardingButton();
}

class _OnBoardingButton extends State<OnBoardingButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.pressedAction,
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
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF20B2AA), Color(0xFF4169E1)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),

        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 120, minHeight: 42),

          child: Row(
            children: [
              if (widget.icon != null && widget.isIconLeft) ...[
                widget.icon!,
                SizedBox(width: 8.w),
              ],
              Text(widget.text, style: TextStyles.font16White500Weight),
              if (widget.icon != null && !widget.isIconLeft) ...[
                SizedBox(width: 8.w),
                widget.icon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
