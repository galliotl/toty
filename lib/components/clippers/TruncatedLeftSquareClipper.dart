import 'package:flutter/material.dart';

class TruncatedLeftSquareClipper extends CustomClipper<Path> {
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
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
      size.width - 10,
      roundnessFactor,
      size.width - roundnessFactor * 1.3,
      roundnessFactor * 1.6,
    );
    path.lineTo(
      roundnessFactor * 0.6,
      size.height * 0.66 - roundnessFactor * 0.5,
    );
    path.quadraticBezierTo(
      0,
      size.height * 0.66,
      0,
      size.height * 0.66 + roundnessFactor,
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
