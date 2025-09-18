import 'package:aa_frontend/core/theming/Colors.dart';
import 'package:aa_frontend/core/widgets/card/animated_card_container.dart';
import 'package:aa_frontend/core/widgets/card/animated_eye_icon.dart';
import 'package:aa_frontend/core/widgets/card/circle_selected_style.dart';
import 'package:aa_frontend/features/onboarding/data/user_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingAnimatedCard extends StatefulWidget {
  final UserType userType;
  final AnimationController animationController;

  const OnBoardingAnimatedCard({
    super.key,
    required this.userType,
    required this.animationController,
  });

  @override
  State<StatefulWidget> createState() => _OnBoardingAnimatedCard();
}

class _OnBoardingAnimatedCard extends State<OnBoardingAnimatedCard> {
  AnimationController get animationController => widget.animationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return _createAnimatedCardContainer(
          widget.userType,
          animationController,
        );
      },
    );
  }
}

AnimatedCardContainer _createAnimatedCardContainer(
  UserType userType,
  AnimationController animationController,
) {
  switch (userType) {
    case UserType.normalUser:
      return AnimatedCardContainer(
        primaryColor: ColorsManager.mainColorUser,
        secondaryColor: ColorsManager.hoverBackgroundUser,
        title: 'user',
        animationController: animationController,
        animatedEyeIcon: AnimatedEyeIcon(
          size: 50.r,
          backgroundColor: ColorsManager.mainColorUser,
          borderColor: ColorsManager.borderColorUser,
          iconColor: ColorsManager.iconColorUser,
          hoverBackgroundColor: ColorsManager.hoverBackgroundUser,
          hoverBorderColor: ColorsManager.hoverBorderUser,
          hoverIconColor: ColorsManager.hoverIconUser,
          animationController: animationController,
        ),
        animatedCircle: AnimatedCircle(
          primaryColor: ColorsManager.mainColorUser,
          secondaryColor: ColorsManager.hoverBackgroundUser,
          animationController: animationController,
          size: 25.r,
          icon: Icon(Icons.check, color: Colors.white, weight: 800.r),
        ),
      );
    case UserType.company:
      return AnimatedCardContainer(
        primaryColor: ColorsManager.mainColorCompany,
        secondaryColor: ColorsManager.hoverBackgroundCompany,
        title: 'Company',
        animationController: animationController,
        animatedEyeIcon: AnimatedEyeIcon(
          size: 50.r,
          backgroundColor: ColorsManager.mainColorCompany,
          borderColor: ColorsManager.borderColorCompany,
          iconColor: ColorsManager.iconColorCompany,
          hoverBackgroundColor: ColorsManager.hoverBackgroundCompany,
          hoverBorderColor: ColorsManager.hoverBorderCompany,
          hoverIconColor: ColorsManager.hoverIconCompany,
          animationController: animationController,
        ),
        animatedCircle: AnimatedCircle(
          primaryColor: ColorsManager.mainColorCompany,
          secondaryColor: ColorsManager.hoverBackgroundCompany,
          animationController: animationController,
          size: 25.r,
          icon: Icon(Icons.check, color: Colors.white, weight: 800.r),
        ),
      );
    case UserType.advertiser:
      return AnimatedCardContainer(
        primaryColor: ColorsManager.mainColorAdvertiser,
        secondaryColor: ColorsManager.hoverBackgroundAdvertiser,
        title: 'Advertiser',
        animationController: animationController,
        animatedEyeIcon: AnimatedEyeIcon(
          size: 50.r,
          backgroundColor: ColorsManager.mainColorAdvertiser,
          borderColor: ColorsManager.borderColorAdvertiser,
          iconColor: ColorsManager.iconColorAdvertiser,
          hoverBackgroundColor: ColorsManager.hoverBackgroundAdvertiser,
          hoverBorderColor: ColorsManager.hoverBorderAdvertiser,
          hoverIconColor: ColorsManager.hoverIconAdvertiser,
          animationController: animationController,
        ),
        animatedCircle: AnimatedCircle(
          primaryColor: ColorsManager.mainColorAdvertiser,
          secondaryColor: ColorsManager.hoverBackgroundAdvertiser,
          animationController: animationController,
          size: 25.r,
          icon: Icon(Icons.check, color: Colors.white, weight: 800.r),
        ),
      );
  }
}
