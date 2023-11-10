import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyIcon extends StatelessWidget {
  final String assetPath;
  final Color color;
  const MyIcon({super.key, required this.assetPath, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: 24,
      width: 24,
      color: color,
    );
  }
}
