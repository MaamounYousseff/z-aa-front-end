import 'package:aa_frontend/core/theming/styles.dart';
import 'package:aa_frontend/core/widgets/logo/silahub_logo.dart';
import 'package:aa_frontend/features/onboarding/data/user_type.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageThree extends StatefulWidget {
  const OnBoardingPageThree({super.key});

  @override
  State<OnBoardingPageThree> createState() => _OnBoardingPageThreeState();
}

class _OnBoardingPageThreeState extends State<OnBoardingPageThree>
    with TickerProviderStateMixin {
  late final AnimationController _userAnimationController;
  late final AnimationController _companyAnimationController;
  late final AnimationController _advertiserAnimationController;

  UserType? selectedType = UserType.normalUser; // default

  @override
  void initState() {
    super.initState();
    _userAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _companyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _advertiserAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _userAnimationController.dispose();
    _companyAnimationController.dispose();
    _advertiserAnimationController.dispose();
    super.dispose();
  }

  void _userButtonOnPressed() {
    if (selectedType == UserType.normalUser) return;

    _reverseCurrent();
    _userAnimationController.forward();

    setState(() => selectedType = UserType.normalUser);
  }

  void _companyButtonOnPressed() {
    if (selectedType == UserType.company) return;

    _reverseCurrent();
    _companyAnimationController.forward();

    setState(() => selectedType = UserType.company);
  }

  void _advertiserButtonOnPressed() {
    if (selectedType == UserType.advertiser) return;

    _reverseCurrent();
    _advertiserAnimationController.forward();

    setState(() => selectedType = UserType.advertiser);
  }

  void _reverseCurrent() {
    switch (selectedType) {
      case UserType.normalUser:
        _userAnimationController.reverse();
        break;
      case UserType.company:
        _companyAnimationController.reverse();
        break;
      case UserType.advertiser:
        _advertiserAnimationController.reverse();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        SilaHubLogo(size: 120.r),
        SizedBox(height: 20.h),
        Text(
          "Choose You're Journey in ",
          style: TextStyles.font21Black500Weight,
        ),
        Text("SILAhub", style: TextStyles.font21_5Black600Weight),
        SizedBox(height: 6.h),
        // User button
        TextButton(
          onPressed: _userButtonOnPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: OnBoardingAnimatedCard(
            userType: UserType.normalUser,
            animationController: _userAnimationController,
          ),
        ),

        // Company button
        TextButton(
          onPressed: _companyButtonOnPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: OnBoardingAnimatedCard(
            userType: UserType.company,
            animationController: _companyAnimationController,
          ),
        ),

        // Advertiser button
        TextButton(
          onPressed: _advertiserButtonOnPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: OnBoardingAnimatedCard(
            userType: UserType.advertiser,
            animationController: _advertiserAnimationController,
          ),
        ),
      ],
    );
  }
}
