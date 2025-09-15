import 'package:aa_frontend/core/theming/styles.dart';
import 'package:aa_frontend/extra/annotations/annotation_info.dart';
import 'package:aa_frontend/features/down_bounce_arrow.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_logo_and_name.dart';
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
    return Column(
      children: [
        const SilaLogoAndName(),
        SizedBox(height: 20.h),
        DownBouncingFlesh(
          animationController: widget.animationController,
          size: 20.h,
        ),
        SizedBox(height: 20.h),
        Text(
          "Connect, Discover & Share",
          style: TextStyles.font24Black700Weight,
        ),
        SizedBox(height: 10.h),
        Text(
          "Join a vibrant community where you explore amazing content, connect with creators, and discover products across all your favorite categories.",
          textAlign: TextAlign.center,
          style: TextStyles.font16GreyDark400Weight,
        ),
        //  SizedBox(height: 20),
        // AnimationShapes(),
        // ExploreConnectShareBar(),
      ],
      //create 2 child :
      //1st child contain the image logo , SILAhub social commerce , flesh
      //2nd child contain the text Connect ...
    );
  }
}
