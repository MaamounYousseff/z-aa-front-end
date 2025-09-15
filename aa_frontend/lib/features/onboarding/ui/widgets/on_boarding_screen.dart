import 'package:aa_frontend/features/onboarding/ui/widgets/pulse_circle.dart';
import 'package:flutter/material.dart';

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
        automaticallyImplyLeading:
            false, // optional: remove default back button
        title: const SizedBox.shrink(), // leave title empty
        flexibleSpace: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            // the group container wraps exactly the 3 pulses
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: PulseCircle(
                    size: 20,
                    isOn: index == _currentPage,
                    controller: _animationController,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentPage = index),
        children: const [
          ColoredBox(color: Colors.red),
          ColoredBox(color: Colors.green),
          ColoredBox(color: Colors.blue),
        ],
      ),
    );
  }
}
