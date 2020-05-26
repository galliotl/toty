import 'package:flutter/material.dart';
import 'package:toty/components/clippers/SquarishClipper.dart';
import 'package:toty/components/layouts/ActionPageClip.dart';

class MyTeamPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActionPageClip(
      clipper: SquarishClipper(),
      title: 'My club',
      pathToImage: 'assets/images/myClub.svg',
      ctaText: 'Go to my club',
      ctaCallback: (BuildContext context) => {},
      caption: 'Handle your club, see members, requests and invitations',
    );
  }
}
