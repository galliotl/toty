import 'package:flutter/material.dart';

class SquarishClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;

    var path = Path();

    path.moveTo(0, size.height * 0.66);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(
      0,
      size.height,
      roundnessFactor,
      size.height,
    );
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - roundnessFactor,
    );
    path.lineTo(size.width, size.height * 0.66);
    path.quadraticBezierTo(
      size.width,
      size.height * 0.66 - roundnessFactor,
      size.width - roundnessFactor,
      size.height * 0.66 - roundnessFactor,
    );
    path.lineTo(
      roundnessFactor,
      size.height * 0.66 - roundnessFactor,
    );
    path.quadraticBezierTo(
      0,
      size.height * 0.66 - roundnessFactor,
      0,
      size.height * 0.66,
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
