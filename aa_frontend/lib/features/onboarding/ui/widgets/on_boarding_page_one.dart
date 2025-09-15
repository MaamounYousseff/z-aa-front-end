import 'package:aa_frontend/features/down_bounce_arrow.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_logo_and_name.dart';
import 'package:flutter/widgets.dart';

class OnBoardingPageOne extends StatefulWidget {
  final AnimationController animationController;
  const OnBoardingPageOne({super.key, required this.animationController});

  @override
  State<StatefulWidget> createState() => _OnBoardingPageOneState();
}

class _OnBoardingPageOneState extends State<OnBoardingPageOne> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SilaLogoAndName(),
        SizedBox(height: 20),
        DownBouncingFlesh(
          animationController: widget.animationController,
          size: 34,
        ),
        //  SizedBox(height: 20),
        //  Text(),
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
