import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SilaHubLogo extends StatefulWidget {
  final double size;
  const SilaHubLogo({super.key, required this.size});

  @override
  State<StatefulWidget> createState() => _SilaHubLogoState();
}

class _SilaHubLogoState extends State<SilaHubLogo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: SvgPicture.asset(
          "assets/svgs/sila_logo.svg",
          width: widget.size,
          height: widget.size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
