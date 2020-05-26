import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/components/texts/ActionPageText.dart';
import 'package:toty/components/cards/IllustrationCard.dart';
import 'package:toty/components/snackbar/loginSnackbar.dart';

class ActionPage extends StatelessWidget {
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

  ActionPage({
    @required this.caption,
    @required this.ctaCallback,
    @required this.ctaText,
    @required this.pathToImage,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActionPageText(
              title: title,
              caption: caption,
            ),
            Expanded(
              child: StreamBuilder(
                stream: Provider.of<AuthService>(context).state,
                builder: (context, snap) {
                  return IllustrationCard(
                    ctaCallback: snap.data == AuthenticationState.Authenticated
                        ? this.ctaCallback
                        : this._ctaCallbackLoginWarning,
                    ctaText: this.ctaText,
                    pathToImage: this.pathToImage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
