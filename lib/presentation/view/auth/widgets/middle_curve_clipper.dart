import 'package:flutter/material.dart';

class MiddleCurveClipper extends CustomClipper<Path> {
  final double curveHeight;

  MiddleCurveClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + curveHeight,
      size.width,
      size.height - curveHeight,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
