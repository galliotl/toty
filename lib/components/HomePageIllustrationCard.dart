import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toty/components/buttons/CallToAction.dart';

class HomePageIllustrationCard extends StatelessWidget {
  final CustomClipper clipper;
  final String pathToImage;
  final String ctaText;
  final Function(BuildContext) ctaCallback;

  HomePageIllustrationCard({
    @required this.clipper,
    @required this.pathToImage,
    @required this.ctaText,
    @required this.ctaCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.clip,
      fit: StackFit.loose,
      children: [
        Positioned(
          bottom: 0,
          top: 0,
          left: 15,
          right: 15,
          child: ClipPath(
            clipper: clipper,
            child: Container(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          top: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(this.pathToImage),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            child: CallToAction(
              callback: ctaCallback,
              text: ctaText,
            ),
          ),
        ),
      ],
    );
  }
}
