import 'package:aa_frontend/core/theming/Colors.dart';
import 'package:aa_frontend/core/theming/styles.dart';
import 'package:aa_frontend/extra/annotations/annotation_info.dart';
import 'package:aa_frontend/core/widgets/bounce/advertiser_shape_bounce.dart';
import 'package:aa_frontend/core/widgets/bounce/company_shape_bounce.dart';
import 'package:aa_frontend/core/widgets/bounce/down_bounce_arrow.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_logo_and_name.dart';
import 'package:aa_frontend/core/widgets/bounce/user_shape_bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageOne extends StatefulWidget {
  final AnimationController animationController;
  const OnBoardingPageOne({super.key, required this.animationController});

  @override
  State<StatefulWidget> createState() => _OnBoardingPageOneState();
}

@NotUnderstand("Why  remove the const before size Box ")
@Answer(
  "Because the size Box height is dynamic and it will change according to the screen size",
)
class _OnBoardingPageOneState extends State<OnBoardingPageOne> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25.h),
          const SilaLogoAndName(),
          SizedBox(height: 20.h),
          DownBouncingFlesh(
            animationController: widget.animationController,
            size: 15.h,
          ),
          SizedBox(height: 10.h),
          Text(
            "Connect, Discover & Share",
            style: TextStyles.font21_5Black600Weight,
          ),
          SizedBox(height: 6.h),
          Text(
            "Join a vibrant community where you explore amazing content, connect with creators, and discover products across all your favorite categories.",
            textAlign: TextAlign.center,
            style: TextStyles.font14Dark500Weight,
          ),
          SizedBox(height: 45.h),
          Container(
            width: double.infinity,
            height: 100.h,
            margin: EdgeInsets.symmetric(horizontal: 70.w),
            child: Stack(
              children: [
                // Top-left
                Align(
                  alignment: Alignment.topLeft,
                  child: CompanyShapeBounce(
                    animationController: widget.animationController,
                    size: 35.r,
                  ),
                ),
                // Center
                Align(
                  alignment: Alignment.center,
                  child: AdvertiserShapeBounce(
                    animationController: widget.animationController,
                    size: 25.r,
                  ),
                ),
                // Bottom-right
                Align(
                  alignment: Alignment.bottomRight,
                  child: UserShapeBounce(
                    animationController: widget.animationController,
                    size: 18.r,
                  ),
                ),
              ],
            ),
          ),
          //  SizedBox(height: 20),
          // AnimationShapes(),
          // ExploreConnectShareBar(),
        ],
      ),
      //create 2 child :
      //1st child contain the image logo , SILAhub social commerce , flesh
      //2nd child contain the text Connect ...
    );
  }
}
