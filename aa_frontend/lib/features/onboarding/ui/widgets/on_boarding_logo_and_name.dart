import 'package:aa_frontend/features/silahub_logo.dart';
import 'package:flutter/material.dart';

class SilaLogoAndName extends StatefulWidget {
  const SilaLogoAndName({super.key});

  @override
  State<StatefulWidget> createState() => _SilaLogoAndNameState();
}

class _SilaLogoAndNameState extends State<SilaLogoAndName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SilaHubLogo(size: 115),
        const SizedBox(height: 8),
        const Text(
          "SILAhub",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 0),
        const Text(
          "social commerce",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
