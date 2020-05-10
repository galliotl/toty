import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/components/HomePageContentText.dart';
import 'package:toty/components/HomePageIllustrationCard.dart';
import 'package:toty/components/snackbar/loginSnackbar.dart';

class HomePageContent extends StatelessWidget {
  final CustomClipper clipper;
  final String title;
  final String caption;
  final String pathToImage;
  final String ctaText;
  final Function(BuildContext) ctaCallback;

  void _ctaCallbackLoginWarning(BuildContext context) {
    Scaffold.of(context).showSnackBar(LoginSnackbar(
      context: context,
    ));
  }

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
    AuthenticationState state = Provider.of<AuthService>(context).state;
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
                ctaCallback: state == AuthenticationState.Authenticated
                    ? this.ctaCallback
                    : this._ctaCallbackLoginWarning,
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
