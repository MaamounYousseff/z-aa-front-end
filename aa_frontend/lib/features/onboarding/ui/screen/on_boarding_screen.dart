import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_bottom_nav_bar.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_page_one.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_page_three.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/on_boarding_page_two.dart';
import 'package:aa_frontend/features/onboarding/ui/widgets/pulse_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final AnimationController _animationController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 254, 255),
        automaticallyImplyLeading: false, // remove default back button
        title: const SizedBox.shrink(), // leave title empty
        flexibleSpace: SafeArea(
          child: Center(
            //to center the Y axis
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: PulseCircle(
                    size: 15.r,
                    isOn: index == _currentPage,
                    controller: _animationController,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 253, 254, 255),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _currentPage = index),
          children: [
            paddedPage(
              OnBoardingPageOne(animationController: _animationController),
            ),
            paddedPage(OnBoardingPageTwo()),
            paddedPage(OnBoardingPageThree()),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 253, 254, 255),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: OnBoardingBottomNavBar(
            pageIndex: _currentPage,
            backAction: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            nextAction: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            getStartedAction: () {
              // Define what should happen when "Get Started" is pressed
              print("Get Started pressed");
            },
          ),
        ),
      ),
    );
  }

  Widget paddedPage(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: child,
    );
  }
}
