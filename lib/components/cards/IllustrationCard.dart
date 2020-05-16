import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toty/components/buttons/CallToAction.dart';

class IllustrationCard extends StatelessWidget {
  final String pathToImage;
  final String ctaText;
  final Function(BuildContext) ctaCallback;

  IllustrationCard({
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
