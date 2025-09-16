import 'package:aa_frontend/core/theming/Colors.dart';
import 'package:aa_frontend/core/theming/styles.dart';
import 'package:aa_frontend/core/widgets/card/card_container.dart';
import 'package:aa_frontend/core/widgets/logo/silahub_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageTwo extends StatelessWidget {
  const OnBoardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25.h),
          SilaHubLogo(size: 140.r),
          SizedBox(height: 30.h),
          Text(
            "Three Ways to Experience",
            style: TextStyles.font21Black500Weight,
          ),
          Text("SILAhub", style: TextStyles.font21_5Black600Weight),
          SizedBox(height: 6.h),
          Text(
            "Each role offers unique features designed for different goals and needs.",
            textAlign: TextAlign.center,
            style: TextStyles.font14Dark500Weight,
          ),
          SizedBox(height: 28.h),
          CardContainer(
            primaryColor: ColorsManager.mainColorUser,
            title: 'Normal User',
            icon: Icons.person_outline,
            strings: ["Browse all posts", "Like content", "Follow markets"],
          ),
          SizedBox(height: 28.h),
          CardContainer(
            primaryColor: ColorsManager.mainColorCompany,
            title: 'Company',
            icon: Icons.business,
            strings: ["Upload Posts", "View Analytics"],
          ),
          SizedBox(height: 28.h),
          CardContainer(
            primaryColor: ColorsManager.mainColorAdvertiser,
            title: 'Advertiser',
            icon: Icons.campaign,
            strings: ["Upvote to post"],
          ),
        ],
      ),
    );
  }
}
