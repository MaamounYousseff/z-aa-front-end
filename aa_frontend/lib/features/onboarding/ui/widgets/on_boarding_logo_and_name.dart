import 'package:aa_frontend/core/theming/styles.dart';
import 'package:aa_frontend/core/widgets/silahub_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SilaLogoAndName extends StatefulWidget {
  const SilaLogoAndName({super.key});

  @override
  State<StatefulWidget> createState() => _SilaLogoAndNameState();
}

class _SilaLogoAndNameState extends State<SilaLogoAndName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circle with shadow
        Container(
          width: 140.r,
          height: 140.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [],
          ),
          child: Center(child: SilaHubLogo(size: 115.r)),
        ),
        SizedBox(height: 0.h),
        Text("SILAhub", style: TextStyles.font20_5Black500Weight),
        SizedBox(height: 0.h),
        Text("social commerce", style: TextStyles.font14Dark500Weight),
      ],
    );
  }
}
