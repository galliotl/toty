import 'package:flutter/material.dart';
import 'package:toty/pages/homePage/HomePageContent.dart';

class CreateaGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageContent(
      clipper: CreateaGameClipper(),
      title: 'Create a game',
      pathToImage: 'assets/images/createaGame.svg',
      ctaText: 'Create a game',
      ctaCallback: (BuildContext context) => {},
      caption: 'Create a match and invite your friends or defy your whole town',
    );
  }
}

class CreateaGameClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;

    var path = Path();

    path.moveTo(0, roundnessFactor * 2);
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
      size.height * 0.66 - roundnessFactor + 10,
      size.width - roundnessFactor,
      size.height * 0.66 - roundnessFactor * 1.3,
    );
    path.lineTo(
      2 * roundnessFactor,
      2 * roundnessFactor,
    );
    path.quadraticBezierTo(
      10,
      roundnessFactor,
      0,
      2 * roundnessFactor,
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
