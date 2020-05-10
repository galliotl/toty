import 'package:flutter/material.dart';
import 'package:toty/components/HomePageContentText.dart';
import 'package:toty/components/HomePageIllustrationCard.dart';

class HomePageContent extends StatelessWidget {
  final CustomClipper clipper;
  final String title;
  final String caption;
  final String pathToImage;
  final String ctaText;
  final Function(BuildContext) ctaCallback;

  HomePageContent({
    @required this.clipper,
    @required this.title,
    @required this.pathToImage,
    @required this.ctaText,
    @required this.ctaCallback,
    @required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageContentText(
              title: title,
              caption: caption,
            ),
            Expanded(
              child: HomePageIllustrationCard(
                clipper: this.clipper,
                ctaCallback: this.ctaCallback,
                ctaText: this.ctaText,
                pathToImage: this.pathToImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
