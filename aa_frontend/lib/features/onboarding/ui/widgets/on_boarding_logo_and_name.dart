import 'package:aa_frontend/core/theming/styles.dart';
import 'package:aa_frontend/features/silahub_logo.dart';
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
        SilaHubLogo(size: 115.r),
        SizedBox(height: 8.h),
        Text("SILAhub", style: TextStyles.font24Black700Weight),
        SizedBox(height: 0.h),
        Text("social commerce", style: TextStyles.font16GreyDark400Weight),
      ],
    );
  }
}
