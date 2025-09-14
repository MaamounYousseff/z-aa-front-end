import 'package:aa_frontend/features/onboarding/ui/widgets/pulse_circle.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3, // number of pages
            (index) => createPulseCircles(index),
          ),
        ),
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() => _currentPage = index); // trigger rebuild
        },
        children: const [
          ColoredBox(color: Colors.red),
          ColoredBox(color: Colors.green),
          ColoredBox(color: Colors.blue),
        ],
      ),
    );
  }

  PulseCircle createPulseCircles(int index) {
    return PulseCircle(size: 20, isOn: index == _currentPage);
  }
}
