import 'package:flutter/material.dart';
import 'package:toty/components/layouts/ActionPageClip.dart';

class MyTeamPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActionPageClip(
      clipper: MyClubClipper(),
      title: 'My club',
      pathToImage: 'assets/images/myClub.svg',
      ctaText: 'Go to my club',
      ctaCallback: (BuildContext context) => {},
      caption: 'Handle your club, see members, requests and invitations',
    );
  }
}

class MyClubClipper extends CustomClipper<Path> {
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
