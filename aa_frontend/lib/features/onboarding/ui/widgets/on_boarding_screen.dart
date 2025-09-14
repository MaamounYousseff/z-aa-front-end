import 'package:aa_frontend/features/onboarding/ui/widgets/pulse_circle.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PulseCircle(size: 20, isOn: true),
            PulseCircle(size: 20, isOn: false),
            PulseCircle(size: 20, isOn: false),
          ],
        ),
      ),
    );
  }
}
